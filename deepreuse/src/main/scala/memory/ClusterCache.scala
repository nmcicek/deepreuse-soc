package deepreuse.memory

import Chisel._
import chisel3.experimental.dontTouch

import freechips.rocketchip.config._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util._
import freechips.rocketchip.subsystem._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.memory._


class ClusterCache(implicit p: Parameters) extends LazyModule {

  val cfg = p(ClusterCacheKey)

  protected def cacheClientParameters = Seq(TLClientParameters(
    name          = s"ClusterCache",
    sourceId      = IdRange(0, 1 max cfg.nMSHRs),
    supportsProbe = TransferSizes(p(MemoryBusKey).blockBytes, p(MemoryBusKey).blockBytes)))

  val node = TLClientNode(Seq(TLClientPortParameters(
    cacheClientParameters,
    minLatency = 1)))

  override lazy val module = new ClusterCacheModule(this)  
}

/***** NONBLOCKING CACHE *****/
class ClusterCacheModule(outer: ClusterCache) extends LazyModuleImp(outer) with ClusterCacheParameters {

  val io = IO(new ClusterCacheBundle(outer))
  io.suggestName("ClusterCacheBundle")

  implicit val edge = outer.node.edges.out(0)
  val (tl_out, _) = outer.node.out(0)

  dontTouch(tl_out.e)

  val wb = Module(new ClusterCacheWritebackUnit)
  val mshrs = Module(new ClusterCacheMSHRFile)  
  val prober = Module(new ClusterCacheProbeUnit)

  io.req.ready := Bool(true)
  val s1_valid = Reg(next=io.req.fire(), init=Bool(false))
  val s1_req = Reg(io.req.bits)
  val s1_replay = Reg(init=Bool(false))
  val s1_clk_en = Reg(Bool())

  val s2_valid = Reg(next=s1_valid, init=Bool(false))
  val s2_req = Reg(io.req.bits)
  val s2_replay = Reg(next=s1_replay, init=Bool(false))
  val s2_valid_masked = Wire(Bool())
  val s2_nack = Wire(Bool())

  val s3_valid = Reg(init=Bool(false))
  val s3_req = Reg(io.req.bits)
  val s3_way = Reg(Bits())

  val s1_read  = isRead(s1_req.cmd)
  val s1_write = isWrite(s1_req.cmd)
  val s1_readwrite = s1_read || s1_write

  val nackfifo = Module(new Queue(new ClusterCacheReq, 3, false, true))
  nackfifo.io.deq.ready := Bool(true)

  private def centroidCalculation(wdata: UInt, rdata: UInt): UInt = {
    val rdata_vectored = Vec.tabulate(maxVectorDim) { i => rdata(dataSize*(i+1)-1, dataSize*i) }
    val wdata_vectored = Vec.tabulate(maxVectorDim) { i => wdata(dataSize*(i+1)-1, dataSize*i) }
    val rdata_count = (rdata >> maxVectorDim*dataSize)(countSize-1, 0)
    
    val return_count = Wire(Bits(width = countSize))
    return_count := rdata_count + UInt(1)
    val return_data = Wire(Bits(width = maxVectorDim*dataSize))
    return_data := (rdata_vectored, wdata_vectored).zipped.map { (rdata,wdata) => rdata + (wdata - rdata)/return_count }.asUInt
    Cat(return_count, return_data)
  }

  when (io.req.valid) {
    s1_req := io.req.bits
    if(DEBUG_PRINTF_CACHE) { when(io.req.ready) {printf("ClusterCache Req Fired! Addr: 0x%x Data: 0x%x\n", io.req.bits.addr, io.req.bits.data)} }
  }
  when (wb.io.meta_read.valid) {
    s1_req.addr := Cat(wb.io.meta_read.bits.tag, wb.io.meta_read.bits.idx) << blockOffBits
    if(DEBUG_PRINTF_CACHE) printf("ClusterCache WriteBack Req Fired!\n")
  }
  when (prober.io.meta_read.valid) {
    s1_req.addr := Cat(prober.io.meta_read.bits.tag, prober.io.meta_read.bits.idx) << blockOffBits
    if(DEBUG_PRINTF_CACHE) printf("ClusterCache Prober Req Fired!\n")
  }
  when (mshrs.io.replay.valid) {
    s1_req := mshrs.io.replay.bits
    if(DEBUG_PRINTF_CACHE) printf("ClusterCache MSHRS Replay Fired!\n")
  }
  when(nackfifo.io.deq.fire()) {
    s1_req := nackfifo.io.deq.bits
    s1_valid := true.B
    if(DEBUG_PRINTF_CACHE) printf("IDCache NackFifo Deq Fired!\n")
  }

  when (s1_clk_en) {
    s2_req := s1_req
    if(DEBUG_PRINTF_CACHE) printf("Meta/data read successful!\n")
  }

  // tags
  def onReset = CCMetadata(UInt(0), ClientMetadata.onReset)
  val meta = Module(new ClusterCacheMetadataArray(onReset _))
  val metaReadArb = Module(new Arbiter(new CCMetaReadReq, 5))
  val metaWriteArb = Module(new Arbiter(new CCMetaWriteReq, 2))
  meta.io.read <> metaReadArb.io.out
  meta.io.write <> metaWriteArb.io.out

  // data
  val data = Module(new ClusterCacheDataArray)
  val readArb = Module(new Arbiter(new CCDataReadReq, 4))
  val writeArb = Module(new Arbiter(new CCDataWriteReq, 2))
  data.io.write <> writeArb.io.out
  data.io.write.bits.data := writeArb.io.out.bits.data 

  // tag read for NackFifo
  metaReadArb.io.in(0).valid := nackfifo.io.deq.fire()
  metaReadArb.io.in(0).bits.idx := nackfifo.io.deq.bits.addr >> blockOffBits

  // data read for NackFifo
  readArb.io.in(0).valid := nackfifo.io.deq.fire()
  readArb.io.in(0).bits.addr := nackfifo.io.deq.bits.addr
  readArb.io.in(0).bits.way_en := ~UInt(0, nWays)

  // tag read for new requests
  metaReadArb.io.in(4).valid := io.req.valid
  metaReadArb.io.in(4).bits.idx := io.req.bits.addr >> blockOffBits
  when (!metaReadArb.io.in(4).ready) { io.req.ready := Bool(false) }
  if(DEBUG_PRINTF_CACHE) for(i<-0 until 5){ when(metaReadArb.io.in(i).valid){ printf("Meta Read %d fired\n", i.U) } }
  if(DEBUG_PRINTF_CACHE) for(i<-0 until 2){ when(metaWriteArb.io.in(i).valid){ printf("Meta Write %d fired\n", i.U) } }

  // data read for new requests
  readArb.io.in(3).valid := io.req.valid
  readArb.io.in(3).bits.addr := io.req.bits.addr
  readArb.io.in(3).bits.way_en := ~UInt(0, nWays)
  when (!readArb.io.in(3).ready) { io.req.ready := Bool(false) }
  if(DEBUG_PRINTF_CACHE) for(i<-0 until 4){ when(readArb.io.in(i).valid){ printf("Data Read %d fired\n", i.U) } }
  if(DEBUG_PRINTF_CACHE) for(i<-0 until 2){ when(writeArb.io.in(i).valid){ printf("Data Write %d fired\n", i.U) } }

  // tag check and way muxing
  def wayMap[T <: Data](f: Int => T) = Vec((0 until nWays).map(f))
  val s1_tag_eq_way = wayMap((w: Int) => meta.io.resp(w).tag === (s1_req.addr >> untagBits)).asUInt
  val s1_tag_match_way = wayMap((w: Int) => s1_tag_eq_way(w) && meta.io.resp(w).coh.isValid()).asUInt
  s1_clk_en := metaReadArb.io.out.valid
  val s1_writeback = s1_clk_en && !s1_valid && !s1_replay
  val s2_tag_match_way = RegEnable(s1_tag_match_way, s1_clk_en)
  val s2_tag_match = s2_tag_match_way.orR
  val s2_hit_state = Mux1H(s2_tag_match_way, wayMap((w: Int) => RegEnable(meta.io.resp(w).coh, s1_clk_en)))
  val (s2_has_permission, _, s2_new_hit_state) = s2_hit_state.onAccess(s2_req.cmd) //TODO update here
  val s2_hit = s2_tag_match && s2_has_permission && s2_hit_state === s2_new_hit_state

  // data muxing
  val s2_data = Reg(Vec(nWays, Bits(width=rowBits)))
  for (w <- 0 until nWays) {
    val en = s1_clk_en && s1_tag_eq_way(w)
    when (en) { s2_data(w) := data.io.resp(w) }
  }
  val s2_data_muxed = Mux(s2_req.entryValid, Mux1H(s2_tag_match_way, s2_data), UInt(0, rowBits))

  // calculate centroid
  val s2_row_data = Wire(Bits(width=rowBits))
  val s2_mask = UIntToOH(s2_req.addr.extract(rowOffBits-1, offsetlsb))
  val s2_data_vectored = Wire(Vec(rowWords, Bits(width=wordBits)))
  s2_data_vectored := Vec.tabulate(rowWords) { i => s2_row_data(wordBits*(i+1)-1, wordBits*i) }
  val s2_wdata = s2_data_vectored.zipWithIndex.map { 
    case (rdata, index) => Mux[UInt](isWrite(s2_req.cmd) && s2_mask(index), centroidCalculation(s2_req.data, rdata), rdata) 
  }.asUInt

  // store 
  s3_valid := (s2_valid_masked && s2_hit || s2_replay) && isWrite(s2_req.cmd)
  when ((s2_valid || s2_replay) && isWrite(s2_req.cmd)) {
    s3_req := s2_req
    s3_req.data := s2_wdata
    s3_way := s2_tag_match_way
  }

  writeArb.io.in(0).bits.addr := s3_req.addr
  writeArb.io.in(0).bits.wmask := UIntToOH(s3_req.addr.extract(rowOffBits-1, offsetlsb))
  writeArb.io.in(0).bits.data := s3_req.data
  writeArb.io.in(0).valid := s3_valid
  writeArb.io.in(0).bits.way_en :=  s3_way

  // replacement policy
  val replacer = new RandomReplacement(nWays)
  val s1_replaced_way_en = UIntToOH(replacer.way)
  val s2_replaced_way_en = UIntToOH(RegEnable(replacer.way, s1_clk_en))
  val s2_repl_meta = Mux1H(s2_replaced_way_en, wayMap((w: Int) => RegEnable(meta.io.resp(w), s1_clk_en && s1_replaced_way_en(w))).toSeq)

  // miss handling
  mshrs.io.req.valid := s2_valid_masked && !s2_hit
  mshrs.io.req.bits := s2_req
  mshrs.io.req.bits.tag_match := s2_tag_match
  mshrs.io.req.bits.old_meta := Mux(s2_tag_match, CCMetadata(s2_repl_meta.tag, s2_hit_state), s2_repl_meta)
  mshrs.io.req.bits.way_en := Mux(s2_tag_match, s2_tag_match_way, s2_replaced_way_en)
  mshrs.io.req.bits.data := s2_req.data
  when (mshrs.io.req.fire() && !mshrs.io.secondary_miss) { replacer.miss }
  tl_out.a <> mshrs.io.mem_acquire
  if(DEBUG_PRINTF_CACHE) { when(mshrs.io.req.fire()) {printf("MSHRS Req Fired!\n")} }

  // replays
  readArb.io.in(1).valid := mshrs.io.replay.valid
  readArb.io.in(1).bits := mshrs.io.replay.bits
  readArb.io.in(1).bits.way_en := ~UInt(0, nWays)
  mshrs.io.replay.ready := readArb.io.in(1).ready
  s1_replay := mshrs.io.replay.valid && readArb.io.in(1).ready
  metaReadArb.io.in(1) <> mshrs.io.meta_read
  metaWriteArb.io.in(0) <> mshrs.io.meta_write

  // probes and releases
  prober.io.req.valid := tl_out.b.valid
  tl_out.b.ready := prober.io.req.ready
  prober.io.req.bits := tl_out.b.bits
  prober.io.way_en := s2_tag_match_way
  prober.io.block_state := s2_hit_state
  metaReadArb.io.in(2) <> prober.io.meta_read
  metaWriteArb.io.in(1) <> prober.io.meta_write
  prober.io.mshr_rdy := mshrs.io.probe_rdy

  // refills
  val grant_has_data = edge.hasData(tl_out.d.bits)
  mshrs.io.mem_grant.valid := tl_out.d.fire()
  mshrs.io.mem_grant.bits := tl_out.d.bits
  tl_out.d.ready := writeArb.io.in(1).ready || !grant_has_data
  writeArb.io.in(1).valid := tl_out.d.valid && grant_has_data && tl_out.d.bits.source < UInt(nMSHRs)
  writeArb.io.in(1).bits.addr := mshrs.io.refill.addr
  writeArb.io.in(1).bits.way_en := mshrs.io.refill.way_en
  writeArb.io.in(1).bits.wmask := ~UInt(0, rowWords)
  writeArb.io.in(1).bits.data := tl_out.d.bits.data
  data.io.read <> readArb.io.out
  readArb.io.out.ready := !tl_out.d.valid || tl_out.d.ready // insert bubble if refill gets blocked
  tl_out.e <> mshrs.io.mem_finish

  // writebacks
  val wbArb = Module(new Arbiter(new CCWritebackReq(edge.bundle), 2))
  wbArb.io.in(0) <> prober.io.wb_req
  wbArb.io.in(1) <> mshrs.io.wb_req
  wb.io.req <> wbArb.io.out
  metaReadArb.io.in(3) <> wb.io.meta_read
  readArb.io.in(2) <> wb.io.data_req
  wb.io.data_resp := s2_data_muxed
  TLArbiter.lowest(edge, tl_out.c, wb.io.release, prober.io.rep)

  // store->load bypassing
  val s4_valid = Reg(next=s3_valid, init=Bool(false))
  val s4_req = RegEnable(s3_req, s3_valid && metaReadArb.io.out.valid)
  val bypasses = List(
    ((s2_valid_masked || s2_replay), s2_req, s2_wdata),
    (s3_valid, s3_req, s3_req.data),
    (s4_valid, s4_req, s4_req.data)
  ).map(r => (r._1 && (s1_req.addr >> wordOffBits === r._2.addr >> wordOffBits) && isWrite(r._2.cmd), r._3))
  val s2_store_bypass_row = Reg(Bits(width = rowBits))
  val s2_store_bypass = Reg(Bool())
  when (s1_clk_en) {
    s2_store_bypass := false.B
    when (bypasses.map(_._1).reduce(_||_)) {
      s2_store_bypass_row := PriorityMux(bypasses)
      s2_store_bypass := true.B
    }
  }

  // nack it like it's hot
  val s1_nack = (s2_valid && s2_nack) || (s1_req.addr(idxMSB,idxLSB) === prober.io.meta_write.bits.idx && !prober.io.req.ready)
  val s2_nack_hit = RegEnable(s1_nack, s1_valid || s1_replay)
  when (s2_nack_hit) { mshrs.io.req.valid := Bool(false) }
  val s2_nack_victim = s2_hit && mshrs.io.secondary_miss
  val s2_nack_miss = !s2_hit && !mshrs.io.req.ready
  s2_nack := s2_nack_hit || s2_nack_victim || s2_nack_miss
  s2_valid_masked := s2_valid && !s2_nack

  // load data or bypass
  s2_row_data := Mux(s2_store_bypass, s2_store_bypass_row, s2_data_muxed)
  val cache_resp_data = s2_row_data >> Cat(s2_mask, Bits(0,log2Up(wordBits)))
  io.resp.bits.cluster := Vec.tabulate(maxVectorDim) { i => cache_resp_data(dataSize*(i+1)-1, dataSize*i) }
  io.resp.bits.count := cache_resp_data >> maxVectorDim*dataSize
  io.resp.valid := (s2_replay || s2_valid_masked && s2_hit)

  when(io.resp.valid && io.verify){
    if(DEBUG_PRINTF_VERIFICATION){
      printf("Cluster_Cache key: 0x%x centroid: 0x%x count: 0x%x\n", s2_req.addr, io.resp.bits.cluster.asUInt, io.resp.bits.count.asUInt)
    }
  }

  // after a nack, block until nack condition resolves to save energy
  val block_miss = Reg(init=Bool(false))
  block_miss := (s2_valid || block_miss) && s2_nack_miss
  when (block_miss || s1_nack) {
    if(DEBUG_PRINTF_CACHE){ printf("CC block miss -> s1_nack: %d block_miss: %d s2_nack_miss: %d s2_valid: %d\n", s1_nack, block_miss, s2_nack_miss, s2_valid) }
    io.req.ready := Bool(false)
    nackfifo.io.deq.ready := Bool(false)
  }



  assert(!nackfifo.io.enq.valid || nackfifo.io.enq.ready, "nackfifo overflow\n")

  val nMiss = Reg(init=UInt(0,64))
  when(mshrs.io.req.fire()){
    nMiss := nMiss + UInt(1,64)
    printf("CC-nMiss: 0x%x\n", nMiss)
  }

  val nReqs = Reg(init=UInt(0,64))
  when(io.req.fire()){
    nReqs := nReqs + UInt(1,64)
    printf("CC-nReqs: 0x%x\n", nReqs)
  }

  // write to nack fifo
  nackfifo.io.enq.valid := s2_valid && s2_nack
  nackfifo.io.enq.bits := s2_req
  nackfifo.io.enq.bits.data := cache_resp_data

  if(DEBUG_PRINTF_CACHE){
    when(tl_out.a.fire()){
      printf("CC tl_out_a_address: 0x%x tl_out_a_data: 0x%x tl_out_a_size: 0x%x tl_out_a_source: 0x%x\n",
              tl_out.a.bits.address, tl_out.a.bits.data, tl_out.a.bits.size, tl_out.a.bits.source)
    }
    when(tl_out.c.fire()){
      printf("CC tl_out_c_address: 0x%x tl_out_c_data: 0x%x tl_out_c_size: 0x%x tl_out_c_source: 0x%x\n",
              tl_out.c.bits.address, tl_out.c.bits.data, tl_out.c.bits.size, tl_out.c.bits.source)
    }
    when(tl_out.d.fire()){
      printf("CC tl_out_d_data: 0x%x tl_out_d_size: 0x%x tl_out_d_source: 0x%x\n",
              tl_out.d.bits.data, tl_out.d.bits.size, tl_out.d.bits.source)
    }   
    when(tl_out.e.fire()){
      printf("CC tl_out_e_sink: 0x%x\n",
              tl_out.e.bits.sink)
    }     
  }

}
