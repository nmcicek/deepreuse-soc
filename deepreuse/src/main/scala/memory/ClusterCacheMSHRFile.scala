package deepreuse.memory

import Chisel._
import Chisel.ImplicitConversions._

import freechips.rocketchip.tilelink._
import freechips.rocketchip.config.{Parameters, Field}


class ClusterCacheMSHRFile(implicit val edge: TLEdgeOut, val p: Parameters) extends Module with ClusterCacheParameters {
  val io = IO(new Bundle {
    val req = Decoupled(new CCMSHRReq).flip
    val secondary_miss = Bool(OUTPUT)

    val mem_acquire  = Decoupled(new TLBundleA(edge.bundle))
    val mem_grant = Valid(new TLBundleD(edge.bundle)).flip
    val mem_finish = Decoupled(new TLBundleE(edge.bundle))

    val refill = new CCRefillReq().asOutput
    val meta_read = Decoupled(new CCMetaReadReq) //idx way_en tag
    val meta_write = Decoupled(new CCMetaWriteReq) //data
    val replay = Decoupled(new CCReplay)
    val wb_req = Decoupled(new CCWritebackReq(edge.bundle))

    val probe_rdy = Bool(OUTPUT)
    val fence_rdy = Bool(OUTPUT)
  })

  io.suggestName("ClusterCacheMSHRFileIO")

  val sdq_val = Reg(init=Bits(0, nSDQ))
  val sdq_alloc_id = PriorityEncoder(~sdq_val(nSDQ-1,0))
  val sdq_rdy = !sdq_val.andR
  val sdq_enq = io.req.valid && io.req.ready
  val sdq = Mem(nSDQ, io.req.bits.data)
  when (sdq_enq) { sdq(sdq_alloc_id) := io.req.bits.data }

  val idxMatch = Wire(Vec(nMSHRs, Bool()))
  val tagList = Wire(Vec(nMSHRs, Bits(width = tagBits)))
  val tag_match = Mux1H(idxMatch, tagList) === io.req.bits.addr >> untagBits

  val wbTagList = Wire(Vec(nMSHRs, Bits()))
  val refillMux = Wire(Vec(nMSHRs, new CCRefillReq))
  val meta_read_arb = Module(new Arbiter(new CCMetaReadReq, nMSHRs))
  val meta_write_arb = Module(new Arbiter(new CCMetaWriteReq, nMSHRs))
  val wb_req_arb = Module(new Arbiter(new CCWritebackReq(edge.bundle), nMSHRs))
  val replay_arb = Module(new Arbiter(new CCReplayInternal, nMSHRs))
  val alloc_arb = Module(new Arbiter(Bool(), nMSHRs))

  var idx_match = Bool(false)
  var pri_rdy = Bool(false)
  var sec_rdy = Bool(false)

  io.fence_rdy := true
  io.probe_rdy := true

  val mshrs = (0 until nMSHRs) map { i =>
    val mshr = Module(new ClusterCacheMSHR(i))

    idxMatch(i) := mshr.io.idx_match
    tagList(i) := mshr.io.tag
    wbTagList(i) := mshr.io.wb_req.bits.tag

    alloc_arb.io.in(i).valid := mshr.io.req_pri_rdy
    mshr.io.req_pri_val := alloc_arb.io.in(i).ready

    mshr.io.req_sec_val := io.req.valid && sdq_rdy && tag_match
    mshr.io.req_bits := io.req.bits
    mshr.io.req_bits.sdq_id := sdq_alloc_id

    meta_read_arb.io.in(i) <> mshr.io.meta_read
    meta_write_arb.io.in(i) <> mshr.io.meta_write
    wb_req_arb.io.in(i) <> mshr.io.wb_req
    replay_arb.io.in(i) <> mshr.io.replay

    mshr.io.mem_grant.valid := io.mem_grant.valid && io.mem_grant.bits.source === UInt(i)
    mshr.io.mem_grant.bits := io.mem_grant.bits
    refillMux(i) := mshr.io.refill

    pri_rdy = pri_rdy || mshr.io.req_pri_rdy
    sec_rdy = sec_rdy || mshr.io.req_sec_rdy
    idx_match = idx_match || mshr.io.idx_match

    when (!mshr.io.req_pri_rdy) { io.fence_rdy := false }
    when (!mshr.io.probe_rdy) { io.probe_rdy := false }

    mshr
  }

  alloc_arb.io.out.ready := io.req.valid && sdq_rdy && !idx_match

  io.meta_read <> meta_read_arb.io.out
  io.meta_write <> meta_write_arb.io.out
  io.wb_req <> wb_req_arb.io.out

  TLArbiter.lowestFromSeq(edge, io.mem_acquire, mshrs.map(_.io.mem_acquire))
  TLArbiter.lowestFromSeq(edge, io.mem_finish,  mshrs.map(_.io.mem_finish))

  io.req.ready := sdq_rdy && Mux(idx_match, tag_match && sec_rdy, pri_rdy)
  io.secondary_miss := idx_match
  io.refill := refillMux(io.mem_grant.bits.source)

  io.replay <> replay_arb.io.out

}


