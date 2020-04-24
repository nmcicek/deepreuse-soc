// See LICENSE for license details.
package fpgashells.shell.xilinx.vcu118shell

import Chisel._
import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg}

import fpgashells.devices.xilinx.xilinxvcu118mig._
import fpgashells.ip.xilinx.{IBUFDS, vcu118_sys_clock_mmcm0, vcu118reset}

import deepreuse.lsh._


trait HasDDR3 { this: VCU118Shell =>
  
  require(!p.lift(MemoryXilinxDDRKey).isEmpty)
  val ddr = IO(new XilinxVCU118MIGPads(p(MemoryXilinxDDRKey)))
  
  def connectMIG(dut: HasMemoryXilinxVCU118MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxvcu118mig.c0_sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxvcu118mig.c0_ddr4_ui_clk
    mig_sys_reset                := dut.xilinxvcu118mig.c0_ddr4_ui_clk_sync_rst
    dut.xilinxvcu118mig.c0_ddr4_aresetn   := mig_resetn
    dut.xilinxvcu118mig.sys_rst   := sys_reset

    ddr <> dut.xilinxvcu118mig
  }
}

abstract class VCU118Shell(implicit val p: Parameters) extends RawModule {

  //-----------------------------------------------------------------------
  // Interface
  //-----------------------------------------------------------------------
  
  // 250Mhz differential sysclk
  val sys_diff_clock_clk_n = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val sys_diff_clock_clk_p = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None

  // active high reset
  val clock                = if(p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val reset                = IO(Input(Bool()))

  //-----------------------------------------------------------------------
  // Wire declrations
  //-----------------------------------------------------------------------

  val sys_clock       = Wire(Clock())
  val sys_reset       = Wire(Bool())

  val dut_clock       = Wire(Clock())
  val dut_reset       = Wire(Bool())
  val dut_resetn      = Wire(Bool())
  val mig_clk250      = Wire(Clock())

  val do_reset        = Wire(Bool())

  val mig_mmcm_locked = Wire(Bool())
  val mig_sys_reset   = Wire(Bool())

  val mig_clock       = Wire(Clock())
  val mig_reset       = Wire(Bool())
  val mig_resetn      = Wire(Bool())

  val vcu118_sys_clock_mmcm0_locked = Wire(Bool())

  if(p(SimEnabled)){
    dut_clock := clock.get
    dut_reset := reset
  }
  else{
    // Differential clock
    val sys_clk_ibufds = Module(new IBUFDS)
    sys_clk_ibufds.io.I  := sys_diff_clock_clk_p.get.asUInt
    sys_clk_ibufds.io.IB := sys_diff_clock_clk_n.get.asUInt

    //-----------------------------------------------------------------------
    // System clock and reset
    //-----------------------------------------------------------------------

    sys_clock := sys_clk_ibufds.io.O.asClock
    sys_reset := reset

    //-----------------------------------------------------------------------
    // Clock Generator
    //-----------------------------------------------------------------------

//    val vcu118_sys_clock_mmcm0 = Module(new vcu118_sys_clock_mmcm0)
//    vcu118_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
//    vcu118_sys_clock_mmcm0.io.reset   := sys_reset
//    mig_clk250                        := vcu118_sys_clock_mmcm0.io.clk_out1
//    dut_clock                         := vcu118_sys_clock_mmcm0.io.clk_out2
//    vcu118_sys_clock_mmcm0_locked     := vcu118_sys_clock_mmcm0.io.locked

    //-----------------------------------------------------------------------
    // System reset
    //-----------------------------------------------------------------------

    do_reset             := mig_sys_reset
    mig_resetn           := !mig_reset
    dut_resetn           := !dut_reset

    val safe_reset = Module(new vcu118reset)

    safe_reset.io.areset := do_reset
    safe_reset.io.clock1 := mig_clock
    mig_reset            := safe_reset.io.reset1
    safe_reset.io.clock4 := dut_clock
    dut_reset            := safe_reset.io.reset4
  }

}
