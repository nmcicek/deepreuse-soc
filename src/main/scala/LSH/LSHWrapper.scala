package FPGA

import chisel3._
import chisel3.util.experimental._
import chisel3.util._
import firrtl.annotations._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.util._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.wrapper._
import deepreuse.memory._

import java.nio.{ByteBuffer, ByteOrder}
import java.nio.file.{Files, Paths}


class LSHWrapper(implicit p:Parameters) extends BaseWrapper
{
  val lsh = LazyModule(new LSHAdvanced)

  override lazy val module = new LSHWrapperModule(this)
}

class LSHWrapperModule(outer: LSHWrapper) extends BaseWrapperModule(outer)
{
  val lshModule = outer.lsh.module

  if(p(SimEnabled)){
    val lshRom = Module(new LSHROM)
    
    val cycle = RegInit(0.U(32.W)) // independent cycle counter
    cycle := cycle + 1.U(32.W)
    
    val readEn = lshModule.io.sram_req_uops.valid && lshModule.io.resetDone 
    lshRom.io.me := readEn
    lshRom.io.address := lshModule.io.sram_req_uops.bits.address
    lshModule.io.sram_resp_uops.data := lshRom.io.q
    
    // reconfiguration
    lshModule.io.conf.get   := lshIO.conf.get
    
    // finish
    lshIO.resetDone         := lshModule.io.resetDone
    lshIO.success           := lshModule.io.sram_req_uops.bits.done 
    if(DEBUG_PRINTF_LSH){
      printf("\n---LSH WRAPPER---\n")
      printf("resetDone: %d success: %d readEn: %d address: 0x%x valid: %d busy: %d\n",
              lshIO.resetDone, lshIO.success, readEn, lshRom.io.address, lshModule.io.sram_req_uops.valid, lshModule.io.sram_req_uops.bits.busy)
    }    
  }else{
    lshModule.io.conf.get := ???
  }
}

class LSHROM(implicit p: Parameters) extends AcceleratorModule 
{

  val subvector_num = p(AcceleratorKey).layer.subVectorNum
  val layer_num = p(AcceleratorKey).layer.layerNum

  val io = IO(new Bundle {
    val address              = Input(UInt(sramRowAddr.W))
    val me                   = Input(Bool())
    val q                    = Output(UInt(sramRowData.W))
  })

  val data_type = 
    dataSize match {
      case 8 => if(fpuEnabled) "fp8" else "int8"
      case 32 => if(fpuEnabled) "fp32" else "int32"
    }    

  val base_dir = System.getProperty("user.dir")
  val contentFileName = base_dir ++"/sw/bin/"++ benchmarkName ++"/"++ data_type ++"/LSH_layer"++ layer_num.toString ++"_subvector"++ subvector_num.toString ++".bin" 
  println(contentFileName)

  val rom = ROMGenerator(ROMConfig("TestROM", math.pow(2,sramRowAddr).toInt, sramRowData))
  rom.io.clock := clock
  rom.io.address := io.address
  rom.io.me := io.me
  io.q := rom.io.q
}
