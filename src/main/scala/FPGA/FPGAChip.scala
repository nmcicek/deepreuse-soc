package FPGA

import Chisel._
import chisel3.{Input, Output, RawModule, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import deepreuse.lsh._
import deepreuse.wrapper._


class FPGAChip(implicit p: Parameters) extends XilinxShell {

 	withClockAndReset(dut_clock, dut_reset){
		
  		if(p(UartEnabled)){
   			val dut = Module(LazyModule(new UartWrapper).module)
			val uartIO = Some(IO(new UARTIO))
			uartIO.get <> dut.uartIO.get
			uartIO.get.suggestName("uartIO")
	  	}else{
			val dut = Module(LazyModule(new LSHWrapper).module)
			val lshIO = Some(IO(new BaseLSHBundle))
			lshIO.get <> dut.lshIO.get
			lshIO.get.suggestName("lshIO")
	  	} 	
  	}
}