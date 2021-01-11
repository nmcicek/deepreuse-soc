package FPGA

import Chisel._
import chisel3.{Input, Output, RawModule, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import deepreuse.lsh._
import deepreuse.wrapper._


class FPGAChip(implicit p: Parameters) extends XilinxShell with HasLSHParameters {

	println("*************************")
	println("fpuEnabled " + fpuEnabled)
  println("maxHashSize " + maxHashSize)
  println("maxVectorDim " + maxVectorDim)
  println("maxElmtSize " + maxElmtSize)
  println("fanOutSize " + fanOutSize)
  println("collector_size " + collector_size)
  println("coreWidth " + coreWidth)
  println("sramRowWord " + sramRowWord)
  println("sramRowData " + sramRowData)
  println("sramRowAddr " + sramRowAddr)
  println("nBanks " + nBanks)
  println("dispatchWidth " + dispatchWidth)
  println("fanSize " + fanSize)
  println("nFans " + nFans)
  println("fetchWidth " + fetchWidth)
  println("CMRowWords " + CMRowWords)
  println("IMRowWords " + IMRowWords)
  println("logCMRowWords " + logCMRowWords)
  println("logIMRowWords " + logIMRowWords)
  println("CAMKeys " + CAMKeys)
  println("CAMKeySize " + CAMKeySize)
  println("bankReqQueueDepth " + bankReqQueueDepth)
  println("fetchQueueDepth " + fetchQueueDepth)
  println("fanQueueDepth " + fanQueueDepth)
  println("logMaxVectorDim " + logMaxVectorDim)
  println("logMaxHashSize " + logMaxHashSize)
  println("logSramRowWord " + logSramRowWord)
  println("logNBanks " + logNBanks)
  println("CMAddrWidth " + CMAddrWidth)
  println("IMAddrWidth " + IMAddrWidth)
  println("benchmarkName " + benchmarkName)
	println("*************************")

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