// See LICENSE for license details.
package fpgashells.ip.xilinx

import Chisel._
import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{Analog}
import freechips.rocketchip.util.{ElaborationArtefacts}


// IBUFDS
class IBUFDS extends BlackBox {
  val io = new Bundle {
    val O         = Bool(OUTPUT)
    val I         = Bool(INPUT)
    val IB        = Bool(INPUT)
  }
}


// KC705 MMCM
class kc705_sys_clock_mmcm0 extends BlackBox {
  val io = new Bundle {
    val clk_in1   = Bool(INPUT)
    val clk_out1  = Clock(OUTPUT)
    val clk_out2  = Clock(OUTPUT)
    val reset     = Bool(INPUT)
    val locked    = Bool(OUTPUT)
  }
  
  ElaborationArtefacts.add(
    "kc705_sys_clock_mmcm0.vivado.tcl",
    """create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name kc705_sys_clock_mmcm0 -dir $ipdir -force
    set_property -dict [list \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_SOURCE {No_buffer} \
    CONFIG.CLKOUT1_USED {true} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50} \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_IN_FREQ {200.000} \
    CONFIG.CLKIN1_JITTER_PS {50.0} \
    CONFIG.MMCM_DIVCLK_DIVIDE {1} \
    CONFIG.NUM_OUT_CLKS {2}] [get_ips kc705_sys_clock_mmcm0] """
  )
}

// KC705 RESET
class kc705reset extends BlackBox
{
  val io = new Bundle{
    val areset = Bool(INPUT)
    val clock1 = Clock(INPUT)
    val reset1 = Bool(OUTPUT)
    val clock4 = Clock(INPUT)
    val reset4 = Bool(OUTPUT)
  }
}


class vcu118reset() extends BlackBox
{
  val io = new Bundle{
    val areset = Bool(INPUT)
    val clock1 = Clock(INPUT)
    val reset1 = Bool(OUTPUT)
    val clock4 = Clock(INPUT)
    val reset4 = Bool(OUTPUT)
  }
}

class vcu118_sys_clock_mmcm0 extends BlackBox {
  val io = new Bundle {
    val clk_in1   = Bool(INPUT)
    val clk_out1  = Clock(OUTPUT)
    val clk_out2  = Clock(OUTPUT)
    val reset     = Bool(INPUT)
    val locked    = Bool(OUTPUT)
  }

  ElaborationArtefacts.add(
    "vcu118_sys_clock_mmcm0.vivado.tcl",
    """create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name vcu118_sys_clock_mmcm0 -dir $ipdir -force
    set_property -dict [list \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_SOURCE {No_buffer} \
    CONFIG.CLKOUT1_USED {true} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50} \
    CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
    CONFIG.PRIM_IN_FREQ {250.000} \
    CONFIG.CLKIN1_JITTER_PS {50.0} \
    CONFIG.MMCM_DIVCLK_DIVIDE {1} \
    CONFIG.NUM_OUT_CLKS {2}] \
    [get_ips vcu118_sys_clock_mmcm0] """
  )
}

