package FPGA

import Chisel._
import chisel3.core.withClockAndReset

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import fpgashells.shell.xilinx.vcu118shell._
import fpgashells.ip.xilinx.vcu118mig._
import fpgashells.devices.xilinx.xilinxvcu118mig._

import deepreuse.lsh._
import deepreuse.wrapper._


class FPGAChip(implicit p: Parameters) extends VCU118Shell {

 	withClockAndReset(dut_clock, dut_reset){
		
		var ddr: XilinxVCU118MIGPads = null
		if(!p(SimEnabled)){
			ddr = IO(new XilinxVCU118MIGPads(p(MemoryXilinxDDRKey)))
			ddr.suggestName("ddrIO")
		}

  		if(p(UartEnabled)){
   			val dut = Module(LazyModule(new UartWrapper).module)
			val uartIO = if(p(UartEnabled)) Some(IO(new UARTIO)) else None
			uartIO.get <> dut.uartIO.get
			uartIO.get.suggestName("uartIO")

			// Clock & Reset
			if(!p(SimEnabled)){
		        	dut.xilinxvcu118mig.c0_sys_clk_i := sys_clock.asUInt
		        	mig_clock                    := dut.xilinxvcu118mig.c0_ddr4_ui_clk
		        	mig_sys_reset                := dut.xilinxvcu118mig.c0_ddr4_ui_clk_sync_rst
		        	dut.xilinxvcu118mig.c0_ddr4_aresetn   := mig_resetn
		        	dut.xilinxvcu118mig.sys_rst   := sys_reset
                                dut_clock                   := dut.xilinxvcu118mig.addn_ui_clkout1

		    	        ddr <> dut.xilinxvcu118mig
		  	}
	  	}else{
			val dut = Module(LazyModule(new LSHWrapper).module)
			val lshIO = if(!p(UartEnabled)) Some(IO(new LSHIO)) else None
			lshIO.get <> dut.lshIO.get
			lshIO.get.suggestName("lshIO")

			// Clock & Reset
			if(!p(SimEnabled)){
		                dut.xilinxvcu118mig.c0_sys_clk_i := sys_clock.asUInt
		    	        mig_clock                    := dut.xilinxvcu118mig.c0_ddr4_ui_clk
		    	        mig_sys_reset                := dut.xilinxvcu118mig.c0_ddr4_ui_clk_sync_rst
		    	        dut.xilinxvcu118mig.c0_ddr4_aresetn   := mig_resetn
		    	        dut.xilinxvcu118mig.sys_rst   := sys_reset
                                dut_clock                   := dut.xilinxvcu118mig.addn_ui_clkout1

			 	ddr <> dut.xilinxvcu118mig
			}
	  	} 	
  	}
}
