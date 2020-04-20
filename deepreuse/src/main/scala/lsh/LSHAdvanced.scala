package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.{Parameters, Field}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._

import deepreuse.fpu._
import deepreuse.memory._
import deepreuse.common._


class LSHAdvanced(implicit p: Parameters) extends BaseLSH {

  lazy val cluster_cache = LazyModule(new ClusterCache)
  lazy val id_cache = LazyModule(new IDCache)
  common_node.node := cluster_cache.node
  common_node.node := id_cache.node

  override lazy val module = new LSHAdvancedModule(this)
}

class LSHAdvancedModule(outer: LSHAdvanced) extends BaseLSHModule(outer) {

  /********** DEFINITIONS **********/
  
  /* Clusters @80000000, IDs @C0000000
   * 1GB for Cluster Memory -> 0x80000000 - 0xBFFFFFFF
   * 1GB for ID Memory      -> 0xC0000000 - 0xFFFFFFFF
   */

  val memory_base_address = if(p(SimEnabled)) p(MemoryModelKey).base else p(MemoryXilinxDDRKey).address.head.base
  val cl_base = UInt(memory_base_address)
  val id_offset = BigInt(1024*1024*1024)
  val id_base = UInt(memory_base_address) + UInt(id_offset)

  println("/***** MEMORY MAP *****\\")
  println("Main memory base address: 0x" + memory_base_address.toString(16))
  println("Cluster memory base address: 0x" + memory_base_address.toString(16))
  println("ID memory base address: 0x" + (memory_base_address + id_offset).toString(16) + "\n")

  /* Get Cluster Cache and ID Cache */
  val cluster_cache = outer.cluster_cache.module
  val id_cache = outer.id_cache.module

  /* Calculate latency of similarity detection */
  val LSHLatency = log2Up(maxVectorDim)  // multiply=1 addition=1

  val stalled = Wire(Bool())
  /********** DEFINITIONS **********/


  /********** GET DATA FROM FETCH BUFFER **********/
  
  val sdmInputData = Wire(Valid(Vec(maxVectorDim, UInt(dataSize.W))))
  sdmInputData.valid := io.inputIDandData.fire()
  sdmInputData.bits := io.inputIDandData.bits.inputData

  val sdmInputID = Wire(Valid(UInt(log2Up(maxNumOfInputs).W)))
  sdmInputID.valid := io.inputIDandData.fire()
  sdmInputID.bits := io.inputIDandData.bits.inputID
  
  assert(!sdmInputData.valid || io.hash_table.valid, "input data should not be valid if hash table is not valid!")

  /********** GET DATA FROM FETCH BUFFER **********/


  /********** RUN SIMILARITY DETECTION **********/
  
  val indexModule = Module(new Index)
  indexModule.io.hash_table := io.hash_table //TODO: get from regmap
  indexModule.io.dimConfReg := io.dimConfReg //TODO: get from regmap
  indexModule.io.hashConfReg := io.hashConfReg //TODO: get from regmap
  indexModule.io.inputData.valid := sdmInputData.valid
  indexModule.io.inputData.bits := sdmInputData.bits
  indexModule.io.enable := !stalled
  
  /********** RUN SIMILARITY DETECTION **********/


  /********** VALID ARRAY **********/

  val memValArray = SeqMem(math.pow(2,maxHashSize).toInt, UInt(0,1.W))
  
  val valArrayReadAddr = Wire(UInt())
  val valArrayReadValid = Wire(Bool())
  val valArrayWriteAddr = Wire(UInt())
  val valArrayWriteData = Wire(UInt())
  val valArrayWriteValid = Wire(Bool())

  /* Initialize valid array */
  val rstCntValArray = Reg(init = UInt(0, maxHashSize + 1))   // reset signals
  val rstValArray = rstCntValArray < (math.pow(2,maxHashSize).toInt).U   // reset signals

  /* Read valid array */
  valArrayReadAddr := Mux(io.readValArr.valid, io.readValArr.bits ,sdmInputID.bits)
  valArrayReadValid := io.readValArr.valid | sdmInputID.valid
  val entryValid = memValArray.read(valArrayReadAddr, valArrayReadValid)
  val updateValArray = Reg(next=sdmInputID.valid) && !entryValid

  /* Write valid array */
  valArrayWriteAddr := Mux(rstValArray, rstCntValArray, Reg(next=sdmInputID.bits))
  valArrayWriteData := ~rstValArray
  valArrayWriteValid := rstValArray || updateValArray
  when(rstValArray) {rstCntValArray := rstCntValArray + UInt(1)}
  when(valArrayWriteValid) {memValArray.write(valArrayWriteAddr, valArrayWriteData)}
  
  if(DEBUG_PRINTF_LSH){
    when(valArrayWriteValid){
      printf("valArrWAddr: 0x%x valArrWData: 0x%x rstValArray: %d rstCntValArray: 0x%x\n", valArrayWriteAddr, valArrayWriteData, rstValArray, rstCntValArray)
    }
  }

  /********** VALID ARRAY **********/


  /********** DELAY INPUT DATA & ID ALONGSIDE **********/

  val cacheReqData = Pipe(sdmInputData.valid, sdmInputData.bits, LSHLatency, !stalled)
  val cacheReqID = Pipe(sdmInputID.valid, sdmInputID.bits, LSHLatency, !stalled) 
  val cacheReqEntryValid = Pipe(Reg(next=sdmInputID.valid), entryValid, LSHLatency-1, !stalled)
  val cacheReqValid = indexModule.io.key.valid && !stalled
  val cacheReqKey = indexModule.io.key.bits

  assert(!(cacheReqData.valid ^ cacheReqID.valid), "delayed input data is not correct!")

  if(DEBUG_PRINTF_LSH){
    when(sdmInputData.valid) {for (i<-0 until maxVectorDim) printf("SDM-InputData(%d): 0x%x\n", i.U, sdmInputData.bits(i))}
    when(sdmInputID.valid) {printf("SDM-InputID: 0x%x\n", sdmInputID.bits)}
    when(cacheReqData.valid) {for(i<-0 until maxVectorDim) printf("Cache-InputData(%d): 0x%x\n",i.U, cacheReqData.bits(i))}
    when(cacheReqID.valid) {printf("Cache-InputID: 0x%x\n", cacheReqID.bits)}
  }

  /********** DELAY INPUT DATA & ID ALONGSIDE **********/


  /********** CACHE INTERFACE **********/
  
  cluster_cache.io.req.valid := io.readCentroid.valid || cacheReqValid
  cluster_cache.io.req.bits.entryValid := io.readCentroid.valid || cacheReqEntryValid.bits.asBool
  cluster_cache.io.req.bits.addr := Mux(io.readCentroid.valid, io.readCentroid.bits, cl_base + (cacheReqKey << log2Up((countSize + maxVectorDim*dataSize)/8)))
  cluster_cache.io.req.bits.data := cacheReqData.bits.asUInt
  cluster_cache.io.req.bits.cmd := Mux(io.readCentroid.valid, M_XRD, M_XWR) //store
  cluster_cache.io.verify := io.verify

  id_cache.io.req.valid := io.readID.valid || cacheReqValid
  id_cache.io.req.bits.entryValid := io.readID.valid || cacheReqEntryValid.bits.asBool
  id_cache.io.req.bits.addr := Mux(io.readID.valid, io.readID.bits, id_base + (cacheReqID.bits << log2Up(maxHashSize/8)))
  id_cache.io.req.bits.data := cacheReqKey
  id_cache.io.req.bits.cmd := Mux(io.readID.valid, M_XRD, M_XWR) //store
  id_cache.io.verify := io.verify

  stalled := !(cluster_cache.io.req.ready && id_cache.io.req.ready)
  io.inputIDandData.ready := !stalled
  /********** CACHE INTERFACE **********/


  /********** RESPONSE TO HOST **********/

  io.clusterCacheReady := cluster_cache.io.req.ready
  io.idCacheReady := id_cache.io.req.ready
  
  io.idOut.valid := id_cache.io.resp.valid
  io.idOut.bits := id_cache.io.resp.bits.hashID

  io.centroidsOut.valid := cluster_cache.io.resp.valid 
  io.centroidsOut.bits.cluster := cluster_cache.io.resp.bits.cluster
  io.centroidsOut.bits.count := cluster_cache.io.resp.bits.count

  io.validArrayOut.valid := Reg(next=valArrayReadValid, init=Bool(false))
  io.validArrayOut.bits := entryValid

  io.resetDone := !rstValArray

  /********** RESPONSE TO HOST **********/

}
