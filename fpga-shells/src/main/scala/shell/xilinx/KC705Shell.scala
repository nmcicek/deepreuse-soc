// See LICENSE for license details.
package fpgashells.shell.xilinx.kc705shell

import Chisel._
import chisel3.core.{Input}
import chisel3.experimental.{RawModule}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}

import fpgashells.devices.xilinx.xilinxkc705mig._
import fpgashells.ip.xilinx.{IBUFDS, kc705_sys_clock_mmcm0, kc705reset}

import deepreuse.lsh._


trait HasDDR3 { this: KC705Shell =>
  
  val ddr = IO(new XilinxKC705MIGPads(p(MemoryXilinxDDRKey)))
  
  def connectMIG(dut: HasMemoryXilinxKC705MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxkc705mig.sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxkc705mig.ui_clk
    mig_sys_reset                := dut.xilinxkc705mig.ui_clk_sync_rst
    mig_mmcm_locked              := dut.xilinxkc705mig.mmcm_locked
    dut.xilinxkc705mig.aresetn   := mig_resetn
    dut.xilinxkc705mig.sys_rst   := sys_reset

    ddr <> dut.xilinxkc705mig
  }
}

abstract class KC705Shell(implicit val p: Parameters) extends RawModule {

  // 200Mhz differential sysclk
  val sys_diff_clock_clk_n = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val sys_diff_clock_clk_p = if(!p(SimEnabled)) Some(IO(Input(Clock()))) else None

  // active high reset
  val clock                = if(p(SimEnabled)) Some(IO(Input(Clock()))) else None
  val reset                = IO(Input(Bool()))

  // Wire declrations
  val sys_clock            = Wire(Clock())
  val sys_reset            = Wire(Bool())

  val dut_clock            = Wire(Clock())
  val dut_reset            = Wire(Bool())
  val dut_resetn           = Wire(Bool())
  val mig_clk200           = Wire(Clock())

  val do_reset             = Wire(Bool())

  val mig_mmcm_locked      = Wire(Bool())
  val mig_sys_reset        = Wire(Bool())

  val mig_clock            = Wire(Clock())
  val mig_reset            = Wire(Bool())
  val mig_resetn           = Wire(Bool())

  val kc705_sys_clock_mmcm0_locked = Wire(Bool())


  if(p(SimEnabled)){
    dut_clock := clock.get
    dut_reset := reset
  }
  else{
    // Differential clock
    val sys_clk_ibufds = Module(new IBUFDS)
    sys_clk_ibufds.io.I  := sys_diff_clock_clk_p.get.asUInt
    sys_clk_ibufds.io.IB := sys_diff_clock_clk_n.get.asUInt

    sys_clock := sys_clk_ibufds.io.O.asClock
    sys_reset := reset

    // Clock Generator
    val kc705_sys_clock_mmcm0 = Module(new kc705_sys_clock_mmcm0)
    kc705_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
    kc705_sys_clock_mmcm0.io.reset   := sys_reset
    mig_clk200                       := kc705_sys_clock_mmcm0.io.clk_out1
    dut_clock                        := kc705_sys_clock_mmcm0.io.clk_out2
    kc705_sys_clock_mmcm0_locked     := kc705_sys_clock_mmcm0.io.locked

    // System reset
    do_reset             := !mig_mmcm_locked || mig_sys_reset || !kc705_sys_clock_mmcm0_locked
    mig_resetn           := !mig_reset
    dut_resetn           := !dut_reset

    val safe_reset = Module(new kc705reset)
    safe_reset.io.areset := do_reset
    safe_reset.io.clock1 := mig_clock
    mig_reset            := safe_reset.io.reset1
    safe_reset.io.clock4 := dut_clock
    dut_reset            := safe_reset.io.reset4
  }

}
