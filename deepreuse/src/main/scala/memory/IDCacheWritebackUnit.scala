package deepreuse.memory

import Chisel._

import freechips.rocketchip.tilelink._
import freechips.rocketchip.config.{Parameters, Field}
import deepreuse.common._


class IDCacheWritebackUnit(implicit val edge: TLEdgeOut, val p: Parameters) extends Module with IDCacheParameters {
  val io = IO(new Bundle {
    val req = Decoupled(new ICWritebackReq(edge.bundle)).flip
    val meta_read = Decoupled(new ICMetaReadReq)
    val data_req = Decoupled(new ICDataReadReq)
    val data_resp = Bits(INPUT, rowBits)
    val release = Decoupled(new TLBundleC(edge.bundle))
  })

  val req = Reg(new ICWritebackReq(edge.bundle))
  val active = Reg(init=Bool(false))
  val r1_data_req_fired = Reg(init=Bool(false))
  val r2_data_req_fired = Reg(init=Bool(false))
  val data_req_cnt = Reg(init = UInt(0, width = log2Up(refillCycles+1))) //TODO Zero width
  val (_, last_beat, all_beats_done, beat_count) = edge.count(io.release)

  io.release.valid := false.B
  when (active) {
    r1_data_req_fired := false.B
    r2_data_req_fired := r1_data_req_fired
    when (io.data_req.fire() && io.meta_read.fire()) {
      r1_data_req_fired := true.B
      data_req_cnt := data_req_cnt + UInt(1)
    }
    when (r2_data_req_fired) {
      io.release.valid := true.B
      when(!io.release.ready) {
        r1_data_req_fired := false.B
        r2_data_req_fired := false.B
        data_req_cnt := data_req_cnt - Mux[UInt](Bool(refillCycles > 1) && r1_data_req_fired, UInt(2), UInt(1))
      }
      when(!r1_data_req_fired) {
        // We're done if this is the final data request and the Release can be sent
        active := data_req_cnt < UInt(refillCycles) || !io.release.ready
      }
    }
  }
  when (io.req.fire()) {
    if(DEBUG_PRINTF_CACHE){ printf("CC Writeback Request Fired\n") }
    active := true.B
    data_req_cnt := UInt(0)
    req := io.req.bits
  }

  io.req.ready := !active

  val fire = active && data_req_cnt < UInt(refillCycles)

  // We reissue the meta read as it sets up the mux ctrl for s2_data_muxed
  io.meta_read.valid := fire
  io.meta_read.bits.idx := req.idx
  io.meta_read.bits.tag := req.tag

  io.data_req.valid := fire
  io.data_req.bits.way_en := req.way_en
  io.data_req.bits.addr := (if(refillCycles > 1) 
                              Cat(req.idx, data_req_cnt(log2Up(refillCycles)-1,0))
                            else req.idx) << rowOffBits

  val r_address = Cat(req.tag, req.idx) << blockOffBits
  val probeResponse = edge.ProbeAck(
                          fromSource = req.source,
                          toAddress = r_address,
                          lgSize = UInt(lgCacheBlockBytes),
                          reportPermissions = req.param,
                          data = io.data_resp)

  val voluntaryRelease = edge.Release(
                          fromSource = req.source,
                          toAddress = r_address,
                          lgSize = UInt(lgCacheBlockBytes),
                          shrinkPermissions = req.param,
                          data = io.data_resp)._2
                          
  io.release.bits := Mux(req.voluntary, voluntaryRelease, probeResponse)
}