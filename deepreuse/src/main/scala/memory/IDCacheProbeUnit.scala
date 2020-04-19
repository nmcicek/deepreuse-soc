package deepreuse.memory

import Chisel._

import freechips.rocketchip.tilelink._
import freechips.rocketchip.config.{Parameters, Field}

import deepreuse.common._


class IDCacheProbeUnit(implicit val edge: TLEdgeOut, val p: Parameters) extends Module with IDCacheParameters {
  val io = new Bundle {
    val req = Decoupled(new TLBundleB(edge.bundle)).flip
    val rep = Decoupled(new TLBundleC(edge.bundle))
    val meta_read = Decoupled(new ICMetaReadReq)
    val meta_write = Decoupled(new ICMetaWriteReq)
    val wb_req = Decoupled(new ICWritebackReq(edge.bundle))
    val way_en = Bits(INPUT, nWays)
    val mshr_rdy = Bool(INPUT)
    val block_state = new ClientMetadata().asInput
  }

  val (s_invalid :: s_meta_read :: s_meta_resp :: s_mshr_req :: s_mshr_resp :: s_release :: s_writeback_req :: s_writeback_resp :: s_meta_write :: Nil) = Enum(UInt(), 9)
  val state = Reg(init=s_invalid)

  val req = Reg(new TLBundleB(edge.bundle))
  val req_idx = req.address(idxMSB, idxLSB)
  val req_tag = req.address >> untagBits

  val way_en = Reg(Bits())
  val tag_matches = way_en.orR
  val old_coh = Reg(new ClientMetadata)
  val miss_coh = ClientMetadata.onReset
  val reply_coh = Mux(tag_matches, old_coh, miss_coh)
  val (is_dirty, report_param, new_coh) = reply_coh.onProbe(req.param)

  io.req.ready := state === s_invalid
  io.rep.valid := state === s_release
  io.rep.bits := edge.ProbeAck(req, report_param)

  assert(!io.rep.valid || !edge.hasData(io.rep.bits), "ProbeUnit should not send ProbeAcks with data, WritebackUnit should handle it")

  io.meta_read.valid := state === s_meta_read
  io.meta_read.bits.idx := req_idx
  io.meta_read.bits.tag := req_tag

  io.meta_write.valid := state === s_meta_write
  io.meta_write.bits.way_en := way_en
  io.meta_write.bits.idx := req_idx
  io.meta_write.bits.data.tag := req_tag
  io.meta_write.bits.data.coh := new_coh

  io.wb_req.valid := state === s_writeback_req
  io.wb_req.bits.source := req.source
  io.wb_req.bits.idx := req_idx
  io.wb_req.bits.tag := req_tag
  io.wb_req.bits.param := report_param
  io.wb_req.bits.way_en := way_en
  io.wb_req.bits.voluntary := Bool(false)

  // state === s_invalid
  when (io.req.fire()) {
    state := s_meta_read
    req := io.req.bits
  }

  // state === s_meta_read
  when (io.meta_read.fire()) {
    state := s_meta_resp
  }

  // we need to wait one cycle for the metadata to be read from the array
  when (state === s_meta_resp) {
    state := s_mshr_req
  }

  when (state === s_mshr_req) {
    old_coh := io.block_state
    way_en := io.way_en
    // if the read didn't go through, we need to retry
    state := Mux(io.mshr_rdy, s_mshr_resp, s_meta_read)
  }

  when (state === s_mshr_resp) {
    state := Mux(tag_matches && is_dirty, s_writeback_req, s_release)
  }

  when (state === s_release && io.rep.ready) {
    state := Mux(tag_matches, s_meta_write, s_invalid)
  }

  // state === s_writeback_req
  when (io.wb_req.fire()) {
    state := s_writeback_resp
  }

  // wait for the writeback request to finish before updating the metadata
  when (state === s_writeback_resp && io.wb_req.ready) {
    state := s_meta_write
  }

  when (io.meta_write.fire()) {
    state := s_invalid
  }
}
