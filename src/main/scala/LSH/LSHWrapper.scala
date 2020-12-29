package FPGA

import Chisel._
import chisel3.util.HasBlackBoxInline
import chisel3.dontTouch

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


class LSHWrapper(implicit p:Parameters) extends BaseWrapper
{
  val lsh = LazyModule(new LSHAdvanced)

  override lazy val module = new LSHWrapperModule(this)
}

class LSHWrapperModule(outer: LSHWrapper) extends BaseWrapperModule(outer)
{
  val lshModule = outer.lsh.module
  val lshRom = Module(new LSHROM)

  // independent cycle counter
  val cycle = Reg(init = UInt(0,32))
  cycle := cycle + 1.U

  val readEn = lshModule.io.sram_uops.valid && lshModule.io.resetDone 
  lshRom.io.clock := clock
  lshRom.io.me := readEn
  lshRom.io.address := lshModule.io.sram_uops.bits.address
  lshModule.io.sram_uops.bits.data := lshRom.io.q

  // reconfiguration
  lshModule.io.conf.hashSize  := lshIO.get.hashSize
  lshModule.io.conf.vectorDim := lshIO.get.vectorDim
  lshModule.io.conf.startAddr := lshIO.get.startAddr
  lshModule.io.conf.endAddr   := lshIO.get.endAddr
  lshModule.io.conf.data      := lshIO.get.data
  
  // finish
  lshIO.get.resetDone         := lshModule.io.resetDone
  lshIO.get.success           := lshModule.io.sram_uops.bits.done 

  if(DEBUG_PRINTF_LSH){
    printf("\n---LSH WRAPPER---\n")
    printf("resetDone: %d success: %d readEn: %d address: 0x%x valid: %d\n",
            lshIO.get.resetDone, lshIO.get.success, readEn, lshRom.io.address, lshModule.io.sram_uops.valid)
  }
}

class LSHROM(implicit p: Parameters) extends ParameterizedBlackBox()(p) with HasBlackBoxInline{

  val subvector_num = p(AcceleratorKey).layer.subVectorNum
  val layer_num = p(AcceleratorKey).layer.layerNum

  val io = IO(new Bundle {
    val clock                = Input(Clock())
    val address              = Input(UInt(sramRowAddr.W))
    val me                   = Input(Bool())
    val q                    = Output(UInt(sramRowData.W))
  })

  io.suggestName("LSHROMIO") 

  val benchmark = 
    maxNumOfInputs match {
      case 102400 => "cifarnet"
      case 291600 => "alexnet"
      case 802816 => "vggnet"
      case 50176 => "mobilenet"
    }

  val data_type = 
    dataSize match {
      case 8 => if(fpuEnabled) "fp8" else "int8"
      case 32 => if(fpuEnabled) "fp32" else "int32"
    }    

  val base_dir = System.getProperty("user.dir")

  setInline("../../deepreuse/src/main/resources/vsrc/LSHROM.v",
    s"""
module LSHROM(
  input clock,
  input me,
  input ["""++ (sramRowAddr-1).toString ++""":0] address,
  output ["""++ (sramRowData-1).toString ++""":0] q
);
  reg ["""++ (sramRowData-1).toString ++""":0] out;
  reg ["""++ (sramRowData-1).toString ++""":0] rom [0: """++ (math.pow(2,sramRowAddr)-1).toString ++"""];
  initial begin: init_and_load
    integer i;
    // 256 is the maximum length of $readmemh filename supported by Verilator
    reg [255*8-1:0] path;
    path = """"++ base_dir ++"""/../deepreuse-sw/bin/"""++ benchmark ++"""/"""++ data_type ++"""/LSH_layer"""++ layer_num.toString ++"""_subvector""" ++ subvector_num.toString ++ """.bin";
    $readmemb(path, rom);
  end : init_and_load
  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end
  assign q = out;
endmodule
    """.stripMargin)

}
