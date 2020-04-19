package deepreuse.fpu

import Chisel._

import deepreuse.common._

import freechips.rocketchip.config.Parameters

class FPUMul(implicit p: Parameters) extends ParameterizedBlackBox()(p) {
  val io = IO(new Bundle {
    val aclk                 = Input(Clock())
    val s_axis_a_tdata       = Input(UInt(dataSize.W))
    val s_axis_a_tvalid      = Input(Bool())
    val s_axis_b_tdata       = Input(UInt(dataSize.W))
    val s_axis_b_tvalid      = Input(Bool())
    val m_axis_result_tdata  = Output(UInt(dataSize.W))
    val m_axis_result_tvalid = Output(Bool())
  })
  io.suggestName("FPUMul")

}