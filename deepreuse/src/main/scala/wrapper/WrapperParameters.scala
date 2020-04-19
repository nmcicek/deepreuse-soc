package deepreuse.wrapper

import Chisel._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.fpu._

import sifive.blocks.devices.uart._

class UARTIO(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val tx      = Output(Bool()) 
  val rx      = Input(Bool())
  val resetDone = Output(Bool())
}

class LSHIO(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val hash_table   = Input(Valid(Vec(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))))
  val readID       = Input(Valid(UInt(log2Up(maxNumOfInputs).W)))
  val readCentroid = Input(Valid(UInt(maxHashSize.W)))
  val readValArr   = Input(Valid(UInt(maxHashSize.W)))
  val clearMem     = Input(Valid(Bool()))
  val hashConfReg  = Input(UInt(log2Up(maxHashSize+1).W))
  val dimConfReg   = Input(UInt(log2Up(maxVectorDim+1).W))
  val resetDone    = Output(Bool()) 
  val success      = Output(Bool()) 
}

abstract class BaseWrapper(implicit p: Parameters) extends LazyModule{
  val lsh: BaseLSH
}

abstract class BaseWrapperModule[+L <: BaseWrapper](_outer: L) extends LazyModuleImp(_outer)
    with HasLSHParameters
    with HasFPUParameters
    with HasUARTParameters
{
  val uartIO = if(p(UartEnabled)) Some(IO(new UARTIO)) else None
  val lshIO = if(!p(UartEnabled)) Some(IO(new LSHIO)) else None

  //uartIO.get.suggestName("uartIOBaseWrapper")
  //lshIO.get.suggestName("lshIOBaseWrapper")

}
