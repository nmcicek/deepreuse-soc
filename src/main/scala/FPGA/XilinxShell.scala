package FPGA

import Chisel._
import chisel3.{Input, Output, RawModule, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util.{ElaborationArtefacts}

import deepreuse.lsh._
import deepreuse.wrapper._

import sifive.fpgashells.ip.xilinx.{IBUFDS}


abstract class XilinxShell(implicit val p: Parameters) extends RawModule {

  // 250Mhz differential sysclk
  val sys_diff_clock_clk_n = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val sys_diff_clock_clk_p = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None

  // sim clock and active high reset
  val clock          = if(p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val reset          = IO(Input(Bool()))

  val sys_clock      = Wire(Clock())
  val sys_reset      = Wire(Bool())

  val dut_clock      = Wire(Clock())
  val dut_reset      = Wire(Bool())

  if(p(SimEnabled)){
  	dut_clock := clock.get
  	dut_reset := reset
  }else{
	val sys_clk_ibufds = Module(new IBUFDS)
	sys_clk_ibufds.io.I  := sys_diff_clock_clk_p.get.asUInt
	sys_clk_ibufds.io.IB := sys_diff_clock_clk_n.get.asUInt

	sys_clock := sys_clk_ibufds.io.O
	sys_reset := reset
	  
	val xilinx_sys_clock_mmcm0 = Module(new xilinx_sys_clock_mmcm0)
	xilinx_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
	xilinx_sys_clock_mmcm0.io.reset   := sys_reset
	val clk200              		  = xilinx_sys_clock_mmcm0.io.clk_out1
	val xilinx_sys_clock_mmcm0_locked = xilinx_sys_clock_mmcm0.io.locked

    dut_clock := clk200
    dut_reset := !xilinx_sys_clock_mmcm0_locked
  }

}

class xilinx_sys_clock_mmcm0 extends BlackBox {
  val io = new Bundle {
    val clk_in1   = Bool(INPUT)
    val clk_out1  = Clock(OUTPUT)
    val reset     = Bool(INPUT)
    val locked    = Bool(OUTPUT)
  }

  // Verify IP
  ElaborationArtefacts.add(
    "xilinx_sys_clock_mmcm0.vivado.tcl",
    """create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name xilinx_sys_clock_mmcm0 -dir $ipdir -force
    set_property -dict [list \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_SOURCE {No_buffer} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_IN_FREQ {250.000} \
    CONFIG.CLKIN1_JITTER_PS {50.0} \
    CONFIG.MMCM_DIVCLK_DIVIDE {5} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {24.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {4.000} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {96.000} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {48} \
    CONFIG.NUM_OUT_CLKS {1} ] [get_ips xilinx_sys_clock_mmcm0] """
  )
}
