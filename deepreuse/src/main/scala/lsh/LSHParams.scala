package deepreuse.lsh

import Chisel._

import deepreuse.common._
import deepreuse.fpu._
import deepreuse.memory._

import freechips.rocketchip.config.{Parameters, Field}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.rocket.constants._


case class XilinxKC705MIGParams(
  address : Seq[AddressSet]
)

case object Advanced extends Field[Boolean](false)
case object SimEnabled extends Field[Boolean](false)
case object UartEnabled extends Field[Boolean](false)
case object MemoryModelKey extends Field[AddressSet](AddressSet(0x80000000L,0x80000000L-1))
case object MemoryXilinxDDRKey extends Field[XilinxKC705MIGParams]


case class LSHParams(
  maxHashSize: Int = 20,
  maxVectorDim: Int = 18,
  numOfHashTables: Int = 1,
  countSize: Int =32,
  maxNumOfInputs: Int = 802816,
  dataSize: Int = 32,
  fpuEnabled: Boolean = false
)

case class LayerParams(
  layerHashSize: Int = 20,
  layerVectorDim: Int = 18,
  layerBatchSize: Int = 100,
  layerNumOfInputs: Int = 102400,
  layerNumOfSubVectors: Int = 9,
  layerNum: Int = 0
)



trait HasLSHParameters extends HasAcceleratorParams with MemoryOpConstants{
  val lshParams = acceleratorParams.lsh

  def fpuEnabled = lshParams.fpuEnabled
  def countSize = lshParams.countSize
  def maxHashSize = lshParams.maxHashSize
  def maxVectorDim = lshParams.maxVectorDim
  def maxNumOfInputs = lshParams.maxNumOfInputs
}

abstract class BaseLSH(implicit p: Parameters) extends LazyModule {

  protected def clientParameters = Seq(TLClientParameters(
    name          = s"LSHNode",
    sourceId      = IdRange(0, 2)))

  val masterNode = TLClientNode(Seq(TLClientPortParameters(clientParameters))) // for basic design
  
  val common_node = LazyModule(new TLXbar) // for advanced design
}

class BaseLSHBundle(implicit p: Parameters) extends AcceleratorBundle()(p) {

  val success              = Input(Bool())
  val verify               = Input(Bool())
  val inputIDandData       = Flipped(new DecoupledIO(new fetchBufferEntry))
  val readID               = Flipped(new DecoupledIO(UInt(log2Up(maxNumOfInputs).W)))
  val idOut                = Output(Valid(UInt(maxHashSize.W)))
  val readCentroid         = Flipped(new DecoupledIO(UInt(maxHashSize.W)))
  val centroidsOut         = Output(new ValidIO(new ClusterCacheResp))
  val readValArr           = Flipped(new DecoupledIO(UInt(maxHashSize.W)))
  val validArrayOut        = Output(Valid(Bool()))
  val clearMem             = Flipped(new DecoupledIO(Bool()))
  val resetDone            = Output(Bool())
  val hash_table           = Input(Valid(Vec(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))))
  val hashConfReg          = Input(UInt())
  val dimConfReg           = Input(UInt())
  val idCacheReady         = Output(Bool())
  val clusterCacheReady    = Output(Bool())
}

class BaseLSHModule(outer: BaseLSH) extends LazyModuleImp(outer)
    with HasLSHParameters
    with HasFPUParameters
    with MemoryOpConstants
{
  val io = IO(new BaseLSHBundle)
  io.suggestName("BaseLSHBundle")
}


class clusterBufferEntry(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val inputData     = Vec(maxVectorDim, UInt(dataSize.W))
  val hashID        = UInt(maxHashSize.W)
}

class idBufferEntry(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val inputID       = UInt(log2Up(maxNumOfInputs).W)
  val hashID        = UInt(maxHashSize.W)
}

class fetchBufferEntry(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val inputID       = UInt(log2Up(maxNumOfInputs).W)
  val inputData     = Vec(maxVectorDim, UInt(dataSize.W))
}

class bufferEntry(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val inputData     = Vec(maxVectorDim, UInt(dataSize.W))
  val inputID       = UInt(log2Up(maxNumOfInputs).W)
  val hashID        = UInt(maxHashSize.W)
}

class StallBufferReq(implicit p: Parameters) extends AcceleratorBundle()(p) {
  val inputData     = Vec(maxVectorDim, UInt(dataSize.W))
  val inputID       = UInt(log2Up(maxNumOfInputs).W)
  val hashID        = UInt(maxHashSize.W)
  val entryValid    = UInt(1.W)
}

object Operations {
  val CC = UInt(0x1)
  val RC = UInt(0x2)
  val RV = UInt(0x3)
  val RI = UInt(0x4)
  val CV = UInt(0x5)
}
