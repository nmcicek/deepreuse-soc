package FPGA

import Chisel._
import chisel3.core.withClockAndReset

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import fpgashells.shell.xilinx.kc705shell._
import fpgashells.ip.xilinx.kc705mig._
import fpgashells.devices.xilinx.xilinxkc705mig._

import deepreuse.lsh._
import deepreuse.wrapper._


class FPGAChip(implicit p: Parameters) extends KC705Shell {

 	withClockAndReset(dut_clock, dut_reset){
		
		var ddr: XilinxKC705MIGPads = null
		if(!p(SimEnabled)){
			ddr = IO(new XilinxKC705MIGPads(p(MemoryXilinxDDRKey)))
			ddr.suggestName("ddrIO")
		}

  		if(p(UartEnabled)){
   			val dut = Module(LazyModule(new UartWrapper).module)
			val uartIO = if(p(UartEnabled)) Some(IO(new UARTIO)) else None
			uartIO.get <> dut.uartIO.get
			uartIO.get.suggestName("uartIO")

			// Clock & Reset
			if(!p(SimEnabled)){
		    	dut.xilinxkc705mig.sys_clk_i := mig_clk200.asUInt
		    	dut.xilinxkc705mig.clk_ref_i := mig_clk200.asUInt
		    	mig_clock                    := dut.xilinxkc705mig.ui_clk
		    	mig_sys_reset                := dut.xilinxkc705mig.ui_clk_sync_rst
		    	mig_mmcm_locked              := dut.xilinxkc705mig.mmcm_locked
		    	dut.xilinxkc705mig.aresetn   := mig_resetn
		    	dut.xilinxkc705mig.sys_rst   := !kc705_sys_clock_mmcm0_locked

		    	ddr <> dut.xilinxkc705mig
		  	}
	  	}else{
			val dut = Module(LazyModule(new LSHWrapper).module)
			val lshIO = if(!p(UartEnabled)) Some(IO(new LSHIO)) else None
			lshIO.get <> dut.lshIO.get
			lshIO.get.suggestName("lshIO")

			// Clock & Reset
			if(!p(SimEnabled)){
			 	dut.xilinxkc705mig.sys_clk_i := mig_clk200.asUInt
			 	dut.xilinxkc705mig.clk_ref_i := mig_clk200.asUInt
			 	mig_clock                    := dut.xilinxkc705mig.ui_clk
			 	mig_sys_reset                := dut.xilinxkc705mig.ui_clk_sync_rst
			 	mig_mmcm_locked              := dut.xilinxkc705mig.mmcm_locked
			 	dut.xilinxkc705mig.aresetn   := mig_resetn
			 	dut.xilinxkc705mig.sys_rst   := !kc705_sys_clock_mmcm0_locked

			 	ddr <> dut.xilinxkc705mig
			}
	  	} 	
  	}
}