// See README.md for license details.

package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.{Parameters, Field}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._

import deepreuse.fpu._
import deepreuse.memory._
import deepreuse.common._


class LSHBasic(implicit p: Parameters) extends BaseLSH {
  override lazy val module = new LSHBasicModule(this)
}

class LSHBasicModule(outer: LSHBasic) extends BaseLSHModule(outer) {

  val (tl_out, edge_out) = outer.masterNode.out(0)

/********** VARIABLE DEFINITIONS **********/
  val memory_base_address = if(p(SimEnabled)) p(MemoryModelKey).base else p(MemoryXilinxDDRKey).address.head.base
  val cl_base = memory_base_address.U //1GB for TLCL
  val id_offset = "h40000000".U //1GB for TLID
  val id_base = memory_base_address.U + id_offset //0xC0000000

  val s_idle :: s_val :: s_cl_read :: s_cl_write :: s_id_read :: s_id_write :: s_read_resp :: s_centroid_req :: Nil = Enum(Bits(), 8)
  val state = Reg(init = s_val)
  state.suggestName(s"state")

  val cur_valid = RegInit(false.B)
  val cur_op = Reg(init = UInt(5, 3))
  val cur_hashID = Reg(UInt())
  val cur_inputID = Reg(UInt())
  val cur_inputData = Reg(UInt((maxVectorDim*dataSize).W))
  val read_cluster_valid = RegInit(false.B)
  val read_cluster = Reg(UInt(width=countSize+maxVectorDim*dataSize))
  val read_ID_valid = RegInit(false.B)
  val read_ID = Reg(UInt())
  var forward_valid = Wire(Bool(false))
  var forwarded_cluster = Wire(UInt(width=countSize+maxVectorDim*dataSize))
  val stall = RegInit(false.B)
  val transferDone = Reg(init=UInt(0, 5))
/********** VARIABLE DEFINITIONS **********/
 
  val memCL_A = Wire(Decoupled(new TLBundleA(edge_out.bundle)))
  val memID_A = Wire(Decoupled(new TLBundleA(edge_out.bundle)))

/********** GET DATA FROM INPUT **********/
  val inputData = Wire(Valid(Vec(maxVectorDim, UInt(dataSize.W))))
  inputData.valid := io.inputIDandData.fire()
  inputData.bits := io.inputIDandData.bits.inputData

  val inputID = Wire(Valid(UInt(log2Up(maxNumOfInputs).W)))
  inputID.valid := io.inputIDandData.fire()
  inputID.bits := io.inputIDandData.bits.inputID
/********** GET DATA FROM INPUT **********/


/********** LATENCY CALCULATION **********/
  var LSHLatency = 0
  if(fpuEnabled){
    LSHLatency = lshMulLatency + log2Up(maxVectorDim)*lshAddLatency
  }
  else{
    LSHLatency = 1 + log2Up(maxVectorDim)  // multiply=1 addition=1  
  }

  var CCLatency = 0
  if(fpuEnabled){
    CCLatency = centAddLatency
  }else{
    CCLatency = 1 // multiply + add + div = 1
  }
/********** LATENCY CALCULATION **********/


/********** DELAY INPUT DATA&ID ALONGSIDE **********/
  val delayedInputData = Pipe(inputData.valid, inputData.bits, LSHLatency) //hash_latency
  val delayedInputID = Pipe(inputID.valid, inputID.bits, LSHLatency) //hash_latency

  assert(!(delayedInputData.valid ^ delayedInputID.valid), "delayed input data is not correct!")

  if(DEBUG_PRINTF_LSH){
    when(inputData.valid){
      for (i<-0 until maxVectorDim) printf("InputData(%d): 0x%x\n", i.U, inputData.bits(i))
    }
    when(inputID.valid){
      printf("InputID: 0x%x\n", inputID.bits)
    }
    when(delayedInputData.valid){
      for(i<-0 until maxVectorDim) printf("DelayedInputData(%d): 0x%x\n",i.U, delayedInputData.bits(i))
    }
    when(delayedInputID.valid){
      printf("DelayedInputID: 0x%x\n", delayedInputID.bits)
    }
  }
/********** DELAY INPUT DATA&ID ALONGSIDE **********/


/********** HASH UNIT **********/
  val indexModule = Module(new Index)
  indexModule.io.hash_table := io.hash_table
  indexModule.io.dimConfReg := io.dimConfReg
  indexModule.io.hashConfReg := io.hashConfReg
  indexModule.io.inputData.valid := inputData.valid
  indexModule.io.inputData.bits := inputData.bits
  indexModule.io.enable := !stall
/********** HASH UNIT **********/

  assert(!inputData.valid || io.hash_table.valid, "input data should not be valid when hash table is not valid!")

/********** CLUSTER QUEUE **********/
  val clusterReadQueue = Module(new Queue(new bufferEntry, LSHLatency, false, true))
  clusterReadQueue.suggestName(s"clusterReadQueue")
  clusterReadQueue.io.enq.valid := indexModule.io.key.valid
  clusterReadQueue.io.enq.bits.hashID := indexModule.io.key.bits
  clusterReadQueue.io.enq.bits.inputID := delayedInputID.bits
  clusterReadQueue.io.enq.bits.inputData := delayedInputData.bits

  val cl_read_valid = clusterReadQueue.io.deq.fire()
  val cl_read_hashID = clusterReadQueue.io.deq.bits.hashID  
  val cl_read_inputID = clusterReadQueue.io.deq.bits.inputID
  val cl_read_inputData = clusterReadQueue.io.deq.bits.inputData

  if(DEBUG_PRINTF_LSH){
    when(clusterReadQueue.io.enq.fire()){
      for(i<-0 until maxVectorDim)
        printf("clusterReadQueue enq fired clQueueData(%d): 0x%x clQueueInputID: 0x%x clQueueHashID: 0x%x\n", 
          i.U, delayedInputData.bits(i), delayedInputID.bits, indexModule.io.key.bits)
    }
    when(clusterReadQueue.io.deq.fire()){
      for(i<-0 until maxVectorDim)
        printf("clusterReadQueue deq fired clQueueData(%d): 0x%x clQueueInputID: 0x%x clQueueHashID: 0x%x\n", 
          i.U, cl_read_inputData(i), cl_read_inputID, cl_read_hashID)
    }
  }
/********** CLUSTER QUEUE **********/


/********** MEMORY UPDATE QUEUE **********/
  val clWriteVal = Wire(Bool(false))
  val clWriteAddr = Wire(UInt())
  val clWriteData = Wire(Vec(maxVectorDim, UInt()))
  val clWriteID = Wire(UInt())

  val memUpdateQueue = Module(new Queue(new bufferEntry, CCLatency, false, true))
  memUpdateQueue.suggestName(s"memUpdateQueue")
  memUpdateQueue.io.enq.valid := clWriteVal
  memUpdateQueue.io.enq.bits.hashID := clWriteAddr
  memUpdateQueue.io.enq.bits.inputID := clWriteID
  memUpdateQueue.io.enq.bits.inputData := clWriteData

  val mem_write_valid = memUpdateQueue.io.deq.fire()
  val mem_write_hashID = memUpdateQueue.io.deq.bits.hashID
  val mem_write_inputID = memUpdateQueue.io.deq.bits.inputID
  val mem_write_inputData = memUpdateQueue.io.deq.bits.inputData

  val memUpdate_delayer = Module(new Delayer(CCLatency))
  memUpdate_delayer.io.data_in.bits.hashID := clWriteAddr
  memUpdate_delayer.io.data_in.bits.inputID := clWriteID
  memUpdate_delayer.io.data_in.bits.inputData := clWriteData
  memUpdate_delayer.io.data_in.valid := clWriteVal


  if(DEBUG_PRINTF_LSH){
    when(memUpdateQueue.io.enq.fire()){
      for(i<-0 until maxVectorDim){
        printf("memUpdateQueue enq fired clQueueData: 0x%x clQueueInputID: 0x%x clQueueHashID: 0x%x\n", clWriteData(i), clWriteID, clWriteAddr)
      }
    }
    when(memUpdateQueue.io.deq.fire()){
      for(i<-0 until maxVectorDim){
        printf("memUpdateQueue deq fired clQueueData: 0x%x clQueueInputID: 0x%x clQueueHashID: 0x%x\n", mem_write_inputData(i), mem_write_inputID, mem_write_hashID)
      }
    }
  }
/********** MEMORY UPDATE QUEUE **********/

  assert(!(indexModule.io.key.valid ^ delayedInputData.valid), "key is generated from hash unit but input data is not delayed correctly!")

/********** VALID ARRAY **********/
  val valArrayReadAddr = Wire(UInt())
  val valArrayReadValid = Wire(Bool())
  valArrayReadValid := true.B // default value

  val memValArray = SeqMem(math.pow(2,maxHashSize).toInt, UInt(0,1.W))

  val rstCntValArray = Reg(init = UInt(0, maxHashSize + 1))   // reset signals
  val rstValArray = rstCntValArray < (math.pow(2,maxHashSize).toInt).U   // reset signals
  val valArrWAddr = Mux(rstValArray, rstCntValArray, cur_inputID)
  val valArrWData = ~rstValArray
  when(rstValArray){
    rstCntValArray := rstCntValArray + UInt(1)
  }
/********** VALID ARRAY **********/


/********** STATE CONTROL UNIT **********/

      io.readCentroid.ready := true.B
      io.readValArr.ready := true.B
      io.readID.ready := true.B
      io.clearMem.ready := true.B
  /******* initial state  *******/
  when(state === s_idle){ // state is idle
    cur_valid := memValArray.read(valArrayReadAddr, valArrayReadValid)
    when(mem_write_valid){
      io.readCentroid.ready := false.B
      io.readValArr.ready := false.B
      io.readID.ready := false.B
      io.clearMem.ready := false.B
      valArrayReadValid := false.B
      transferDone := UInt(0)
      cur_hashID := mem_write_hashID
      cur_inputID := mem_write_inputID
      cur_inputData := mem_write_inputData.asUInt
      state := s_cl_write
    }.elsewhen(cl_read_valid){
      cur_op := Operations.CC // do lsh + centroid calculation
      io.readCentroid.ready := false.B
      io.readValArr.ready := false.B
      io.readID.ready := false.B
      io.clearMem.ready := false.B
      valArrayReadAddr := cl_read_hashID
      cur_hashID := cl_read_hashID
      cur_inputID := cl_read_inputID
      cur_inputData := cl_read_inputData.asUInt
      state := s_val
    }.elsewhen(io.readCentroid.valid){
      cur_op := Operations.RC //read centroid
      io.readValArr.ready := false.B
      io.readID.ready := false.B
      io.clearMem.ready := false.B
      valArrayReadAddr := io.readCentroid.bits
      cur_hashID := io.readCentroid.bits
      state := s_cl_read
    }.elsewhen(io.readID.valid){
      cur_op := Operations.RI
      io.clearMem.ready := false.B
      io.readValArr.ready := false.B
      cur_inputID := io.readID.bits
      state := s_id_read
    }.elsewhen(io.readValArr.valid){
      cur_op := Operations.RV // read valid array
      io.clearMem.ready := false.B
      valArrayReadAddr := io.readValArr.bits
      state := s_val
    }.elsewhen(io.clearMem.valid){
    	cur_op := Operations.CV
	    rstCntValArray := 0.U
	    valArrayReadValid := false.B
    	state := s_val
    }.otherwise{
      valArrayReadValid := false.B
      state := s_idle
    }
  }
  /******* initial state  *******/

  /******* write cluster info to memory  *******/
  val clusterDataSize = math.ceil((countSize + maxVectorDim*dataSize).toFloat/(edge_out.bundle.dataBits)).toInt
  when(state === s_cl_write){
    when(memCL_A.ready){
      transferDone := transferDone + UInt(1)
      cur_inputData := cur_inputData >> edge_out.bundle.dataBits
      when(transferDone === (clusterDataSize - 1).U){
        transferDone := UInt(0)
        state := s_id_write
      }
    }
  }
  /******* write cluster info to memory  *******/

  /******* write id info to memory  *******/
  val idDataSize = math.ceil(maxHashSize.toFloat/(edge_out.bundle.dataBits)).toInt
  when(state === s_id_write){
    when(memID_A.ready){
      transferDone := transferDone + UInt(1)
      cur_hashID := cur_hashID >> edge_out.bundle.dataBits
      when(transferDone === (idDataSize - 1).U){
        transferDone := UInt(0)
        state := s_idle
      }      
    }
  }
  /******* write id info to memory  *******/

  /******* read/update valid array *******/
  when(state === s_val) {
  	when(cur_op === Operations.RV){
  		state := s_idle
  	}.elsewhen(cur_valid && (cur_op === Operations.CC || cur_op === Operations.RC)){
      state := s_cl_read
    }.otherwise {
      memValArray.write(valArrWAddr, valArrWData)
      when(!rstValArray && (cur_op === Operations.CC)){
        read_cluster := UInt(0)
        state := s_centroid_req
      }.elsewhen(!rstValArray && (cur_op === Operations.RC)){
        read_cluster_valid := !Bool(fpuEnabled)
        read_cluster := UInt(0)
        if(fpuEnabled) state := s_centroid_req else state := s_idle
      }.elsewhen(!rstValArray && (cur_op === Operations.CV)){
        state := s_idle        
      }
    }
  }
  assert(!rstValArray || (state === s_val), "trying to reset valid array while not in val state!")
  /******* read/update valid array *******/


  /******* read memory for cluster info *******/
  when(state === s_cl_read){
    when(cur_op === Operations.CC || cur_op === Operations.RC){
  		read_cluster := UInt(0)
  		state := s_read_resp
  	}
  }
  /******* read memory for cluster info *******/


  /******* read memory for ID info *******/
  when(state === s_id_read){
    when(cur_op === Operations.RI){
      read_ID := UInt(0)
      state := s_read_resp      
    }
  }
  /******* read memory for ID info *******/


  /******* memory response for cluster/ID *******/
  val (_, _, refill_done, refill_address_inc) = edge_out.addr_inc(tl_out.d)
  val refill_idx = refill_address_inc >> log2Ceil(edge_out.manager.beatBytes)
  when(state === s_read_resp){
    tl_out.d.ready := true.B
  	when(tl_out.d.fire()){
      when(tl_out.d.bits.source === UInt(0)){
        read_cluster := (tl_out.d.bits.data << (edge_out.bundle.dataBits.U)*refill_idx) | read_cluster
        when(refill_done){
          when(cur_op === Operations.RC){
            read_cluster_valid := !Bool(fpuEnabled)
            if(fpuEnabled) state := s_centroid_req else state := s_idle
          }.elsewhen(cur_op === Operations.CC){
            state := s_centroid_req            
          }
        }
      }.elsewhen(tl_out.d.bits.source === UInt(1)){
        read_ID := (tl_out.d.bits.data << (edge_out.bundle.dataBits.U)*refill_idx) | read_ID
        when(refill_done){
          read_ID_valid := true.B
          state := s_idle
        }
      }
  	}
  }
  /******* memory response for cluster/ID *******/

  /******* issue request to calculate centroid *******/
  when(state === s_centroid_req){
    state := s_idle
  }
  /******* issue request to calculate centroid *******/

/********** STATE CONTROL UNIT **********/


/********** TILELINK MEMORY INTERFACE **********/
  memCL_A.valid := (state === s_cl_read) || (state === s_cl_write)
  memCL_A.bits.opcode := Mux(state === s_cl_write, CacheOpConsts.write, CacheOpConsts.read)
  memCL_A.bits.size := log2Up((countSize + maxVectorDim*dataSize)/8).U
  memCL_A.bits.source := UInt(0)
  memCL_A.bits.data := cur_inputData 
  memCL_A.bits.address := cl_base + cur_hashID << (countSize + maxVectorDim*dataSize)/8
  memCL_A.bits.mask := ~UInt(0)

  memID_A.valid := (state === s_id_read) || (state === s_id_write)
  memID_A.bits.opcode := Mux(state === s_id_write, CacheOpConsts.write, CacheOpConsts.read)
  memID_A.bits.size := log2Up(maxHashSize/8).U
  memID_A.bits.source := UInt(1)
  memID_A.bits.data := cur_hashID
  memID_A.bits.address := id_base + cur_inputID << log2Up(maxHashSize/8)
  memID_A.bits.mask := ~UInt(0)

	TLArbiter.lowestFromSeq(edge_out, tl_out.a, Seq(memCL_A, memID_A))
/********** TILELINK MEMORY INTERFACE **********/


/********** CENTROID CALCULATION **********/
  val updateClusters = Wire(Vec(maxVectorDim, Valid(UInt(dataSize.W))))
  val updateClustersValid = updateClusters.map(_.valid).foldLeft(true.B)(_ & _)
  val centroids = Wire(Vec(maxVectorDim, Valid(UInt(dataSize.W))))

  if(fpuEnabled){
    // Integer (for count) to float converter
    val IntToFloatModule = Module(new IntToFloat)
    IntToFloatModule.io.aclk := clock
    IntToFloatModule.io.s_axis_a_tvalid := state === s_centroid_req && cur_op === Operations.RC
    IntToFloatModule.io.s_axis_a_tdata := read_cluster(dataSize*(maxVectorDim)+countSize-1, dataSize*(maxVectorDim))
    val current_count_float = Wire(UInt())
    val current_count_valid = Wire(Bool())

    for (i <- 0 until maxVectorDim) {
      val fpuAddModule = Module(new FPUAdd)
	    fpuAddModule.io.aclk := clock
	    fpuAddModule.io.s_axis_a_tdata := Mux(forward_valid, forwarded_cluster(dataSize*(i+1), dataSize*i), read_cluster(dataSize*(i+1)-1, dataSize*i))
	    fpuAddModule.io.s_axis_a_tvalid := state === s_centroid_req && cur_op === Operations.CC
	    fpuAddModule.io.s_axis_b_tdata := cur_inputData(dataSize*(i+1), dataSize*i)
	    fpuAddModule.io.s_axis_b_tvalid := state === s_centroid_req && cur_op === Operations.CC
	    if(DEBUG_PRINTF_LSH){
	      when(fpuAddModule.io.s_axis_a_tvalid.toBool && fpuAddModule.io.s_axis_b_tvalid.toBool){
	        printf("(%d) --> FPUADD_A: 0x%x FPUADD_B: 0x%x\n", i.U, fpuAddModule.io.s_axis_a_tdata, fpuAddModule.io.s_axis_b_tdata)
	      }
	    }

      val fpuDivModule = Module(new FPUDiv)
      val delayed_current_cluster = Pipe(state === s_centroid_req && cur_op === Operations.RC, read_cluster(dataSize*(i+1)-1, dataSize*i), integerToFloatLatency)
      fpuDivModule.io.aclk := clock
      fpuDivModule.io.s_axis_a_tdata := delayed_current_cluster.bits
      fpuDivModule.io.s_axis_a_tvalid := current_count_valid
      fpuDivModule.io.s_axis_b_tdata := current_count_float
      fpuDivModule.io.s_axis_b_tvalid := current_count_valid
      if(DEBUG_PRINTF_LSH){
        when(fpuDivModule.io.s_axis_a_tvalid.toBool && fpuDivModule.io.s_axis_b_tvalid.toBool){
          printf("(%d) --> FPUDIV_A: 0x%x FPUDIV_B: 0x%x current_count_float: 0x%x delayed_current_cluster: 0x%x\n",
            i.U, fpuDivModule.io.s_axis_a_tdata, fpuDivModule.io.s_axis_b_tdata, current_count_float, delayed_current_cluster.bits)
        }
      }

	    if(p(SimEnabled)){
	      val delayed_cluster = Pipe(fpuAddModule.io.m_axis_result_tvalid.toBool, fpuAddModule.io.m_axis_result_tdata, centAddLatency)
	      updateClusters(i).valid := Mux(i.U < io.dimConfReg, delayed_cluster.valid, true.B)
	      updateClusters(i).bits := Mux(i.U < io.dimConfReg, delayed_cluster.bits, 0.U)

        val delayed_count = Pipe(IntToFloatModule.io.m_axis_result_tvalid.toBool, IntToFloatModule.io.m_axis_result_tdata, integerToFloatLatency)
        current_count_float := delayed_count.bits
        current_count_valid := delayed_count.valid

        val delayed_div = Pipe(fpuDivModule.io.m_axis_result_tvalid.toBool, fpuDivModule.io.m_axis_result_tdata, divLatency)
        centroids(i).bits := Mux(i.U < io.dimConfReg, delayed_div.bits, 0.U)
        centroids(i).valid := Mux(i.U < io.dimConfReg, delayed_div.valid, true.B)

	      if(DEBUG_PRINTF_LSH){
	      	when(delayed_cluster.valid){
            printf("FPUADD(%d) result valid current_count_float: 0x%x\n", i.U, current_count_float)
          }
          when(delayed_div.valid){
            printf("FPUDIV(%d) result valid\n", i.U)
          }
	      }
	    }else{
	      updateClusters(i).bits := Mux(i.U < io.dimConfReg, fpuAddModule.io.m_axis_result_tdata, 0.U)
	      updateClusters(i).valid := Mux(i.U < io.dimConfReg, fpuAddModule.io.m_axis_result_tvalid, true.B)
        current_count_float := IntToFloatModule.io.m_axis_result_tdata
        current_count_valid := IntToFloatModule.io.m_axis_result_tvalid
        centroids(i).valid := Mux(i.U < io.dimConfReg, fpuDivModule.io.m_axis_result_tvalid, true.B)
        centroids(i).bits := Mux(i.U < io.dimConfReg, fpuDivModule.io.m_axis_result_tdata, 0.U)
      }
    }
  }
  else{
    for (i <- 0 until maxVectorDim) {
    	val read_cluster_element = Mux(forward_valid, forwarded_cluster(dataSize*(i+1)-1, dataSize*i), read_cluster(dataSize*(i+1)-1, dataSize*i))
    	val count = Mux(forward_valid, forwarded_cluster(dataSize*(maxVectorDim)+countSize-1, dataSize*(maxVectorDim)), read_cluster(dataSize*(maxVectorDim)+countSize-1, dataSize*(maxVectorDim)))
    	val cur_input_element = cur_inputData(dataSize*(i+1)-1, dataSize*i)
    	updateClusters(i) := Pipe((state === s_centroid_req) && (cur_op === Operations.CC),
                                (read_cluster_element*count + cur_input_element)/(count + UInt(1)),
                                CCLatency)
     }
  }

  clWriteVal := updateClustersValid
  clWriteID := cur_inputID
  clWriteAddr := cur_hashID
  clWriteData := Vec(updateClusters.map(_.bits))
/********** CENTROID CALCULATION **********/


/********** STALL CONDITIONS **********/
  val hashID_delayer = Module(new Delayer(CCLatency)) //plus 1 is for stage 1
  hashID_delayer.io.data_in.bits.hashID := cur_hashID
  hashID_delayer.io.data_in.valid := state === s_centroid_req && cur_op === Operations.CC
  val final_hashID = hashID_delayer.io.data_out(CCLatency-1).bits.hashID
  val final_hashID_valid = hashID_delayer.io.data_out(CCLatency-1).valid

  var willStall = Bool(false)
  for(i <-0 until CCLatency-1){
    willStall = willStall ||
                ((cl_read_hashID === hashID_delayer.io.data_out(i).bits.hashID) &&
                  clusterReadQueue.io.deq.valid &&
                  hashID_delayer.io.data_out(i).valid)
  }

  when(willStall){
    stall := true.B
    clusterReadQueue.io.deq.ready := false.B
    io.inputIDandData.ready := false.B
  }.elsewhen(updateClustersValid && (final_hashID === cl_read_hashID) && clusterReadQueue.io.deq.valid){
    stall := false.B
    clusterReadQueue.io.deq.ready := state === s_idle && !memUpdateQueue.io.deq.valid
    io.inputIDandData.ready := state === s_idle && !memUpdateQueue.io.deq.valid
  }
  .otherwise{
    clusterReadQueue.io.deq.ready := state === s_idle && !memUpdateQueue.io.deq.valid && !stall
    io.inputIDandData.ready := state === s_idle && !memUpdateQueue.io.deq.valid && !stall
  }
  
  memUpdateQueue.io.deq.ready := state === s_idle
/********** STALL CONDITIONS **********/


/********** FORWARD CONDITIONS **********/
  for(i <-0 until CCLatency){
    when(memUpdate_delayer.io.data_out(i).valid ){
      when((cur_hashID === memUpdate_delayer.io.data_out(i).bits.hashID) && (state === s_centroid_req && cur_op === Operations.CC)){
        forward_valid := true.B
        forwarded_cluster := memUpdate_delayer.io.data_out(i).bits.inputData.asUInt
      }      
    }
  }
/********** FORWARD CONDITIONS **********/


/********** SEND INFO TO CPU **********/
  io.idOut.valid := read_ID_valid
  io.idOut.bits := read_ID

  if(fpuEnabled) {
    io.centroidsOut.valid := centroids.map(_.valid).foldLeft(true.B)(_ & _) 
    io.centroidsOut.bits.cluster := centroids.map(_.bits)
  }
  else{
    io.centroidsOut.valid := read_cluster_valid 
    io.centroidsOut.bits.cluster := Vec.tabulate(maxVectorDim) { i => read_cluster(dataSize*(i+1)-1, dataSize*i) }
  }
    
  io.validArrayOut.valid := (state === s_val) && (cur_op === Operations.RV)
  io.validArrayOut.bits := cur_valid
/********** SEND INFO TO CPU **********/
    
  // reset done
  io.resetDone := !rstValArray && !io.clearMem.valid

}
