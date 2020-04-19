package FPGA

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.subsystem._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.wrapper._
import deepreuse.memory._

import sifive.blocks.devices.uart._

import fpgashells.devices.xilinx.xilinxkc705mig._


class UartWrapper(implicit p: Parameters) extends BaseWrapper
{
  val lsh = if(p(Advanced)) LazyModule(new LSHAdvanced) else LazyModule(new LSHBasic) // TODO do with if(p(Advanced)) 

  val cacheRowBytes = p(ClusterCacheKey).rowBits/8
  require(p(ClusterCacheKey).rowBits == p(IDCacheKey).rowBits)

  val BroadcastParams(nTrackers, bufferless) = p(BroadcastKey)
  val lineBytes = p(MemoryBusKey).beatBytes
  val cacheBlockBytes = p(MemoryBusKey).blockBytes
  val bh = LazyModule(new TLBroadcast(lineBytes, nTrackers, bufferless))  
  val ww = LazyModule(new TLWidthWidget(cacheRowBytes))

  var xilinxkc705mig: XilinxKC705MIG = null
  if(p(SimEnabled)){
    val memoryModel = LazyModule(new TLRAM(address = p(MemoryModelKey), beatBytes = lineBytes))
    if(p(Advanced)) memoryModel.node := TLFragmenter(lineBytes, cacheBlockBytes, holdFirstDeny=true) := bh.node := ww.node := lsh.common_node.node else memoryModel.node := lsh.masterNode
  }else{
    xilinxkc705mig = LazyModule(new XilinxKC705MIG(p(MemoryXilinxDDRKey)))
    if(p(Advanced)) xilinxkc705mig.node := TLFragmenter(lineBytes, cacheBlockBytes, holdFirstDeny=true) := bh.node := ww.node := lsh.common_node.node else xilinxkc705mig.node := lsh.masterNode
  }
  
  override lazy val module = new UartWrapperModule(this)
}

class UartWrapperModule(outer: UartWrapper) extends BaseWrapperModule(outer) 
{

  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size

  var xilinxkc705mig: XilinxKC705MIGIO = null
  if(!p(SimEnabled)){
    xilinxkc705mig = IO(new XilinxKC705MIGIO(depth))
    xilinxkc705mig <> outer.xilinxkc705mig.module.io.port
    xilinxkc705mig.suggestName("xilinxkc705migIO")
  }

  val lshModule = outer.lsh.module
  val totCycleNum = dataSize / uartDataBits //for 32-bits it is 4
  val uartModule = Module(new UARTModule(p(UartKey)))

  uartIO.get.tx := uartModule.io.port.txd
  uartModule.io.port.rxd := uartIO.get.rx
  val txData = uartModule.io.txData // 8-bit txData
  val rxData = uartModule.io.rxData // 8-bit rxData
  val s_idle :: s_rxHeader :: s_rxInput_points :: s_rxHash_table :: s_rxReadCentroid :: s_rxInputID :: s_rxHashConf :: s_rxDimConf :: s_rxClearMem :: s_txHeader :: s_txClusterOut :: s_txRout :: s_txValArrayOut :: s_txClearDone :: Nil = Enum(Bits(), 14)
  val state = Reg(init = s_idle)
  val prevState = RegNext(state)
  //printf("Current state: %d\n", state)
  state.suggestName(s"state")
  prevState.suggestName(s"prevState")
  // counters checking whether all data is received
  val inputReceived = Reg(init = UInt(0, log2Up(maxVectorDim).W))
  val hashReceived = Reg(init = UInt(0, log2Up(maxHashSize).W))
  val dataReceived = Reg(init = UInt(0, 2.W))
  val prevHashReceived = RegNext(hashReceived)
  val prevInputReceived = RegNext(inputReceived)
  inputReceived.suggestName(s"inputReceived")
  hashReceived.suggestName(s"hashReceived")
  dataReceived.suggestName(s"dataReceived")
  prevHashReceived.suggestName(s"prevHashReceived")
  prevInputReceived.suggestName(s"prevInputReceived")
  val inputSent = Reg(init = UInt(0, log2Up(math.ceil(dataSize.toFloat / uartDataBits).toInt).W))
  val inputIDSent = Reg(init = UInt(0, log2Up(math.ceil(maxHashSize.toFloat/uartDataBits).toInt).W))
  val dataSentIdx = Reg(init = UInt(0, log2Up(maxVectorDim).W))
    
    inputSent.suggestName(s"inputSent")
    inputIDSent.suggestName(s"inputIDSent")
    dataSentIdx.suggestName(s"dataSentIdx")
    val rxHeader = Reg(init = UInt(0))
    val txHeader = Reg(init = UInt(0))
    rxHeader.suggestName(s"rxHeader")
    txHeader.suggestName(s"txHeader")
    // Memories
    val hashTableMem = Mem(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))
    hashTableMem.suggestName(s"hashTableMem")
    // Interpret RX data
    val accInputData = Reg(Vec(maxVectorDim, UInt(dataSize.W)))
    val accHashData = Reg(Vec(maxVectorDim, UInt(dataSize.W)))
    val accReadCentAddr = Reg(Valid(UInt(maxHashSize.W)))
    val accReadValArr = Reg(Valid(UInt(maxHashSize.W)))
    val accHashConfReg = Reg(UInt(log2Up(maxHashSize+1).W))
    val accDimConfReg = Reg(UInt(log2Up(maxVectorDim+1).W))
    val accInputID = Reg(Valid(UInt(log2Up(maxNumOfInputs).W)))
    
    accInputData.suggestName(s"accInputData")
    accHashData.suggestName(s"accHashData")
    accReadCentAddr.suggestName(s"accReadCentAddr")
    accReadValArr.suggestName(s"accReadValArr")
    accHashConfReg.suggestName(s"accHashConfReg")
    accDimConfReg.suggestName(s"accDimConfReg")
    accInputID.suggestName(s"accInputID")
    //  TX data
    val rIDOut = Reg(UInt(maxHashSize.W))
    val rClusterOut = Reg(Vec(maxVectorDim, UInt(dataSize.W)))
    val rValArrOut = Reg(UInt(1.W))
    val inputDataValid = Reg(init = UInt(0,1.W))
    inputDataValid.suggestName(s"inputDataValid")
    val hashTableValid = Reg(init = UInt(0,1.W))
    hashTableValid.suggestName(s"hashTableValid")
    val clearMem = Reg(init = UInt(0,1.W))
    clearMem.suggestName(s"clearMem")
    rIDOut.suggestName(s"rIDOut")
    rClusterOut.suggestName(s"rClusterOut")
    rValArrOut.suggestName(s"rValArrOut")
    // default value
    inputDataValid := 0.U
    accReadCentAddr.valid := 0.U
    accReadValArr.valid := 0.U
    accInputID.valid := 0.U
    when(reset || clearMem.asBool){
      // reset state
      when(state =/= s_rxClearMem){
        state := s_idle
      }
      // reset counter registers for RX
      dataReceived := 0.U
      hashReceived := 0.U
      inputReceived := 0.U
      prevHashReceived := 0.U
      prevInputReceived := 0.U
      // reset counter registers for TX
      inputSent := 0.U
      inputIDSent := 0.U
      dataSentIdx := 0.U
      // reset header registers
      rxHeader := 0.U
      txHeader := 0.U
      // reset registers received from host through UART
      accInputData := Vec.fill(maxVectorDim)(0.U)
      accHashData := Vec.fill(maxVectorDim)(0.U)
      accReadCentAddr.bits := 0.U
      accReadValArr.bits := 0.U
      accHashConfReg := maxHashSize.U
      accDimConfReg := maxVectorDim.U
      accInputID.bits := 0.U
      // reset stored key-inputID pairs and read_out (rout) register
      rIDOut := 0.U
      rClusterOut := Vec.fill(maxVectorDim)(0.U)
      rValArrOut := 0.U
      // reset valid signal for stored hashTable
      hashTableValid := 0.U
      // inputID valid
      accInputID.valid := 0.U
      // readCentroidAddress
      accReadCentAddr.valid := 0.U
      // readValArr
      accReadValArr.valid := 0.U
    }
    // Idle state
    when(state === s_idle) {
      //default tx values
      txData.valid := false.B
      txData.bits := 0.U
      when(rxData.fire()) {
        if(DEBUG_PRINTF_UART){
          printf("rxData fired rxData:0x%x\n", rxData.bits);
        }
        state := s_rxHeader
        rxHeader := rxData.bits
      }
    }
    // RX header state
    when(state === s_rxHeader) {
      dataReceived := 0.U
      hashReceived := 0.U
      inputReceived := 0.U
      prevHashReceived := 0.U
      prevInputReceived := 0.U
      when(rxHeader === Bits(1)) {
        accInputData := Vec.fill(maxVectorDim)(0.U)
        state := s_rxInput_points
      }.elsewhen(rxHeader === Bits(2)) {
        accHashData := Vec.fill(maxVectorDim)(0.U)
        state := s_rxHash_table
      }.elsewhen(rxHeader === Bits(4)) {
        accReadCentAddr.valid := 0.U
        accReadCentAddr.bits := 0.U
        state := s_rxReadCentroid
      }.elsewhen(rxHeader === Bits(8) || rxHeader === Bits(64)){
        accInputID.valid := 0.U
        accInputID.bits := 0.U
        state := s_rxInputID
      }.elsewhen(rxHeader === Bits(16)){
        accHashConfReg := 0.U
        state := s_rxHashConf
      }.elsewhen(rxHeader === Bits(32)){
        accDimConfReg := 0.U
        state := s_rxDimConf
      }.elsewhen(rxHeader === Bits(128)){
        accReadValArr.valid := 1.U
        accReadValArr.bits := 0.U
        txHeader := 4.U
        state := s_txHeader
      }.elsewhen(rxHeader === Bits(3)){
        clearMem := 1.U
        when(lshModule.io.clearMem.ready){
          state := s_rxClearMem          
        }
      }.otherwise {
        state := s_idle
      }
    }
    def formRxData(indexH: UInt, rxData: Bits): UInt = {
      val result = if(dataSize == uartDataBits) rxData else Cat(Fill(dataSize-uartDataBits, 0.U), rxData)
      (result << indexH).asUInt()
    }
    def formRxAddr(indexH: UInt, rxData: Bits): UInt = {
      val result = Cat(Fill(24, 0.U), rxData)
      (result << indexH).asUInt()
    }
    val inputBucketReceived = inputReceived === (accDimConfReg - 1.U) //UInt(maxVectorDim - 1) //&& (dataReceived === 3.U) && rxData.fire()
    // RX - input points are stored in memory
    when(state === s_rxInput_points) {
      when((prevInputReceived === (accDimConfReg - 1.U)) && (inputReceived =/= prevInputReceived)) { // save it to memory
        if(DEBUG_PRINTF_UART){
          printf("---InputData--- inputdata store operation finished\n")
          for(i<-0 until maxVectorDim)
            printf("---InputData--- accInputData(%d): 0x%x\n", i.U, accInputData(i))
        }
        state := s_idle
        inputDataValid := 1.U
      }
      when(rxData.fire()) { // construct 32 bit data from received rxData
        when(dataReceived === (totCycleNum -1).U) { // A single input data received and saved to temp reg accInputData
          dataReceived := 0.U
          if(DEBUG_PRINTF_UART){
            printf("---InputData--- dataReceived cleared\n")
          }
          when(inputBucketReceived) { // maxVectorDim sized data received
            if(DEBUG_PRINTF_UART){
              printf("---InputData--- inputReceived cleared\n")
            }
            inputReceived := 0.U
          }.otherwise {
            if(DEBUG_PRINTF_UART){
              printf("---InputData--- inputReceived is incremented\n")
            }
            inputReceived := inputReceived + 1.U
          }
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---InputData--- dataReceived is incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        val indexH = (dataReceived << 3).asUInt()
        accInputData(inputReceived) := accInputData(inputReceived) | formRxData(indexH, rxData.bits)
      }
    }
    val hashBucketReceived = inputReceived === (accDimConfReg - 1.U)//UInt(maxVectorDim - 1) //&& (dataReceived === 3.U)
    val allHashBucketsReceived = hashReceived === (accHashConfReg - 1.U)//UInt(maxHashSize - 1) // hashBucketReceived &&
    // RX - hash table data is stored in memory
    when(state === s_rxHash_table) {
      when(hashReceived =/= prevHashReceived) { // save it to memory
        if(DEBUG_PRINTF_UART){
          for(i<-0 until maxVectorDim)
            printf("---HashTable--- accHashData(%d): 0x%x\n", i.U, accHashData(i))
        }
        hashTableMem.write(prevHashReceived, accHashData)
        accHashData := Vec.fill(maxVectorDim)(0.U)
        if(DEBUG_PRINTF_UART){
          printf("---HashTable--- hashData stored into hashTable\n")
        }
        when(prevHashReceived === (accHashConfReg - 1.U)) {
          if(DEBUG_PRINTF_UART){
            printf("---HashTable--- hashTable store operation finished\n")
          }
          hashTableValid := 1.U
          state := s_idle
          if(DEBUG_PRINTF_UART){
            for(i<-0 until maxHashSize)
              for(j<-0 until maxVectorDim)
                printf("---HashTable--- hashTable(%d)(%d): 0x%x\n", i.U, j.U, hashTableMem(i)(j))
          }
        }
      }
      when(rxData.fire()) { // construct dataSize bit data from received rxData
        when(dataReceived === (totCycleNum -1).U) { // A single input data received and saved to memory
          dataReceived := 0.U
          if(DEBUG_PRINTF_UART){
            printf("---HashTable--- dataReceived cleared\n")
          }
          when(hashBucketReceived) { // A single input data received and saved to memory
            inputReceived := 0.U
            if(DEBUG_PRINTF_UART){
              printf("---HashTable--- inputReceived cleared\n")
            }
            when(allHashBucketsReceived) { // whole hash table received
              if(DEBUG_PRINTF_UART){
                printf("---HashTable--- allHashBucketsReceived\n")
                printf("---HashTable--- hashReceived cleared\n")
              }
              hashReceived := 0.U
            }.otherwise {
              hashReceived := hashReceived + 1.U
              if(DEBUG_PRINTF_UART){
                printf("---HashTable--- hashReceived is incremented\n")
              }
            }
          }.otherwise {
            if(DEBUG_PRINTF_UART){
              printf("---HashTable--- inputReceived is incremented\n")
            }
            inputReceived := inputReceived + 1.U
          }
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---HashTable--- dataReceived is incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        
        val indexH = (dataReceived << 3).asUInt()
        accHashData(inputReceived) := accHashData(inputReceived) | formRxData(indexH, rxData.bits)
      }
    }
    // Getting input ID
    when(state === s_rxInputID) {
      when(rxData.fire()) { // construct 32 bit data from received rxData
        when(dataReceived === 3.U) { // A single input data received and saved to memory
          if(DEBUG_PRINTF_UART){
            printf("---InputID--- dataReceived cleared and inputID valid accInputID: 0x%x\n", accInputID.bits)
          }
          dataReceived := 0.U
          accInputID.valid := 1.U
          when(rxHeader === Bits(64)){ // If read ID
            if(DEBUG_PRINTF_UART){
              printf("---InputID--- read ID operation\n")
            }
            state := s_txHeader
            txHeader := 2.U
          }.otherwise {
            if(DEBUG_PRINTF_UART){
              printf("---InputID--- set ID operation\n")
            }
            state := s_idle
          }
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---InputID--- dataReceived incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        val indexH = (dataReceived << 3).asUInt()
        accInputID.bits := accInputID.bits | formRxAddr(indexH, rxData.bits)
      }
    }
    // Getting read address
    when(state === s_rxReadCentroid) {
      when(rxData.fire()) { // construct 32 bit data from received rxData
        when(dataReceived === 3.U) { // A single input data received and saved to memory
          if(DEBUG_PRINTF_UART){
            printf("---readCentroid--- dataReceived cleared and readCent valid accReadCentAddr: 0x%x\n", accReadCentAddr.bits)
          }
          dataReceived := 0.U
          accReadCentAddr.valid := 1.U
          if(DEBUG_PRINTF_UART){
            printf("---readCentroid--- send output back\n")
          }
          state := s_txHeader // send output to python code
          txHeader := 1.U
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---readCentroid--- dataReceived incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        val indexH = (dataReceived << 3).asUInt()
        accReadCentAddr.bits := accReadCentAddr.bits | formRxAddr(indexH, rxData.bits)
      }
    }
    // Getting hashConfReg register
    when(state === s_rxHashConf) {
      when(rxData.fire()) { // construct 32 bit data from received rxData
        when(dataReceived === 3.U) { // A single input data received and saved to memory
          if(DEBUG_PRINTF_UART){
            printf("---hashConf--- dataReceived cleared accHashConfReg: 0x%x\n", accHashConfReg)
          }
          dataReceived := 0.U
          state := s_idle // send output to python code
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---hashConf--- dataReceived incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        val indexH = (dataReceived << 3).asUInt()
        accHashConfReg := accHashConfReg | formRxAddr(indexH, rxData.bits)
      }
    }
    // Getting dimConfReg register
    when(state === s_rxDimConf) {
      when(rxData.fire()) { // construct 32 bit data from received rxData
        when(dataReceived === 3.U) { // A single input data received and saved to memory
          if(DEBUG_PRINTF_UART){
            printf("---dimConf--- dataReceived cleared accDimConfReg: 0x%x\n", accDimConfReg)
          }
          dataReceived := 0.U
          state := s_idle // send output to python code
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---dimConf--- dataReceived incremented\n")
          }
          dataReceived := dataReceived + 1.U
        }
        val indexH = (dataReceived << 3).asUInt()
        accDimConfReg := accDimConfReg | formRxAddr(indexH, rxData.bits)
      }
    }
    when(state === s_rxClearMem) {
      clearMem := 0.U
      when(lshModule.io.resetDone){
        state := s_txHeader
        txHeader := 8.U
      }
    }
    // TX header state
    when(state === s_txHeader) {
      inputSent := 0.U
      inputIDSent := 0.U
      dataSentIdx := 0.U
      when(txHeader === Bits(1)) {
        when(lshModule.io.centroidsOut.valid){
          if(DEBUG_PRINTF_UART){
            printf("---txHeader--- centroidsOut is valid \n")
            for(i<-0 until maxVectorDim)
              printf("---txHeader--- lshModule.io.centroidsOut.bits(%d): 0x%x\n", i.U, lshModule.io.centroidsOut.bits.cluster(i))
          }
          state := s_txClusterOut
          rClusterOut := lshModule.io.centroidsOut.bits.cluster
        }
      }.elsewhen(txHeader === Bits(2)) {
        when(lshModule.io.idOut.valid){
          if(DEBUG_PRINTF_UART){
            printf("---txHeader--- idOut is valid lshModule.io.idOut.bits: 0x%x\n", lshModule.io.idOut.bits)
          }
          state := s_txRout
          rIDOut := lshModule.io.idOut.bits //Since it is register, result is ready immediately
        }
      }.elsewhen(txHeader === Bits(4)) {
       lshModule.io.readValArr.bits := accReadValArr.bits
       lshModule.io.readValArr.valid := accReadValArr.valid
        accReadValArr.valid := false.B
        when(lshModule.io.validArrayOut.valid){
          if(DEBUG_PRINTF_UART){
            printf("---txHeader--- valArrayOut is valid lshModule.io.validArrayOut.bits: 0x%x accReadValArr.bits: 0x%x\n", lshModule.io.validArrayOut.bits, accReadValArr.bits)
          }
          state := s_txValArrayOut
          rValArrOut := lshModule.io.validArrayOut.bits
        }
      }.elsewhen(txHeader === Bits(8)){
        state := s_txClearDone
      }.otherwise {
        state := s_idle
      }
    }
    val singleDataSent = inputSent === (math.ceil(dataSize.toFloat/uartDataBits).toInt -1).U
    val allDataSent = dataSentIdx === (accDimConfReg - 1.U)//(maxVectorDim -1).U
    val cluster = rClusterOut(dataSentIdx)
    // Sending readed clusterSums out
    when(state === s_txClusterOut) {
      when(txData.ready) {
        // send data through UART
        txData.bits := (cluster.asUInt() >> (inputSent << 3).asUInt())
        txData.valid := true.B
        when(singleDataSent) { // A single input data sent
          inputSent := 0.U
          if(DEBUG_PRINTF_UART){
            printf("---txClusterOut--- inputSent cleared\n")
          }
          when(allDataSent) { // All keys sent
            if(DEBUG_PRINTF_UART){
              printf("---txClusterOut--- allDataSent --> dataSentIdx cleared\n")
            }
            dataSentIdx := 0.U
            state := s_idle
          }.otherwise {
            if(DEBUG_PRINTF_UART){
              printf("---txClusterOut--- dataSentIdx incremented\n")
            }
            dataSentIdx := dataSentIdx + 1.U
          }
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---txClusterOut--- inputSent incremented\n")
          }
          inputSent := inputSent + 1.U
        }
      }.otherwise {
        txData.valid := false.B
      }
    }
    val singleIDSent = inputIDSent === (math.ceil(maxHashSize.toFloat/uartDataBits).toInt -1).U
    // Sending readed ID data
    when(state === s_txRout) {
      when(txData.ready) {
        // send data through uart
        txData.bits := (rIDOut >> (inputIDSent << 3).asUInt())
        txData.valid := true.B
        when(singleIDSent) { // A single readed out data sent
          if(DEBUG_PRINTF_UART){
            printf("---txRout--- inputIDSent cleared\n")
          }
          inputIDSent := 0.U
          state := s_idle
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---txRout--- inputIDSent incremented\n")
          }
          inputIDSent := inputIDSent + 1.U
        }
      }.otherwise {
        txData.valid := false.B
      }
    }
    val allValidArraySent = accReadValArr.bits === (math.pow(2, maxHashSize).toInt - 1).U
    // getting valid array out
    when(state === s_txValArrayOut){
      when(txData.ready) {
        // send data through UART
        txData.bits := rValArrOut
        txData.valid := true.B
        when(allValidArraySent) { // All keys sent
          if(DEBUG_PRINTF_UART){
            printf("---txValArrayOut--- allDataSent --> readID cleared\n")
          }
          accReadValArr.valid := 0.U
          accReadValArr.bits := 0.U
          state := s_idle
        }.otherwise {
          if(DEBUG_PRINTF_UART){
            printf("---txValArrayOut--- readID incremented\n")
          }
          accReadValArr.valid := 1.U
          accReadValArr.bits := accReadValArr.bits + 1.U
          txHeader := 4.U
        	state := s_txHeader
        }
      }.otherwise {
        txData.valid := false.B
      }
    }
    // send clear done
    when(state === s_txClearDone){
      when(txData.ready) {
        // send data through UART
        txData.bits := 1.U
        txData.valid := true.B
        state := s_idle
      }.otherwise {
        txData.valid := false.B
      }
    }
    // Fetch Buffer
    val fetchBuffer = Module(new Queue(new fetchBufferEntry, 10, false, true))
    fetchBuffer.suggestName(s"fetchBuffer")
    fetchBuffer.io.enq.valid := inputDataValid //& accInputID.valid
    fetchBuffer.io.enq.bits.inputID := accInputID.bits
    fetchBuffer.io.enq.bits.inputData := accInputData
    rxData.ready := fetchBuffer.io.enq.ready
    if(DEBUG_PRINTF_UART){
      when(fetchBuffer.io.enq.fire()){
        printf("FetchBuffer Enq Fired -> enqInputID: 0x%x\n", accInputID.bits)
        for(i<-0 until maxVectorDim)
          printf("enqInputData(%d): 0x%x\n",i.U, accInputData(i))
      }
    }
    // Connection with inputData input of LSH module
    lshModule.io.inputIDandData <> fetchBuffer.io.deq
    if(DEBUG_PRINTF_UART){
      when(fetchBuffer.io.deq.fire()){
        printf("FetchBuffer Deq Fired -> deqInputID: 0x%x\n", fetchBuffer.io.deq.bits.inputID)
        for(i<-0 until maxVectorDim)
          printf("deqInputData(%d): 0x%x\n",i.U, fetchBuffer.io.deq.bits.inputData(i))
      }
    }
    if(DEBUG_PRINTF_UART){
      when(lshModule.io.inputIDandData.fire()){
        printf("InputIDandData fired -> InputID: 0x%x\n", lshModule.io.inputIDandData.bits.inputID)
        for(i<-0 until maxVectorDim)
          printf("InputData(%d): 0x%x\n",i.U, lshModule.io.inputIDandData.bits.inputData(i))
      }
    }
    // Connection with hashTable input of LSH module
    lshModule.io.hash_table.valid := hashTableValid
    for (i <- 0 until hashTableMem.length.toInt) {
      lshModule.io.hash_table.bits(i) := hashTableMem(i)
    }
    // Read caches inside accelerator
    lshModule.io.readID := accInputID
    lshModule.io.readCentroid := accReadCentAddr
    if(DEBUG_PRINTF_UART){
      when(accInputID.valid){
        printf("inputID valid - readID: 0x%x\n", lshModule.io.readID.bits)
      }
      when(accReadCentAddr.valid){
        printf("accReadCentAddr valid - accReadCentAddr: 0x%x\n", lshModule.io.readCentroid.bits)      
      }
    }
    
    // Connect reconfiguration reg
    lshModule.io.hashConfReg := Mux(state === s_rxHashConf, maxHashSize.U, accHashConfReg)
    lshModule.io.dimConfReg := Mux(state === s_rxDimConf, maxVectorDim.U, accDimConfReg)
    lshModule.io.readValArr := accReadValArr
    // clearMems
    lshModule.io.clearMem.valid := clearMem
    // resetDone
    uartIO.get.resetDone := lshModule.io.resetDone
  
}

