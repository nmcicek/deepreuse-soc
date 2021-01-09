package FPGA

import Chisel._
import chisel3.{Input, Output, RawModule, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import deepreuse.lsh._
import deepreuse.wrapper._


class FPGAChip(implicit p: Parameters) extends XilinxShell {

 	withClockAndReset(dut_clock, dut_reset){
		val dut = Module(LazyModule(new LSHWrapper).module)
		if(p(SimEnabled)){
			val lshIO = IO(new LSHWrapperBundle)
			lshIO <> dut.lshIO
			lshIO.suggestName("lshIO")
		}else{
			val fpgaIO = IO(new FPGAIOBundle)
			fpgaIO <> dut.lshIO.fpga_io.get
			fpgaIO.suggestName("fpgaIO")
		}
	}
}