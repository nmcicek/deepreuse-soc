package deepreuse.common

import Chisel._

import freechips.rocketchip.config.{Parameters, Field}

import deepreuse.lsh._
import deepreuse.fpu._
import sifive.blocks.devices.uart._


case object AcceleratorKey extends Field[AcceleratorParams]

case class AcceleratorParams(
	val frequency: BigInt,
	val lsh: LSHParams,
	val fpu: FPUParams,
	val layer: LayerParams
)

trait HasAcceleratorParams {
	implicit val p: Parameters
	def acceleratorParams: AcceleratorParams = p(AcceleratorKey)
	def dataSize = acceleratorParams.lsh.dataSize
	def layerNumOfInputs = acceleratorParams.layer.layerNumOfInputs
	def layerVectorDim = acceleratorParams.layer.layerVectorDim
	def layerHashSize = acceleratorParams.layer.layerHashSize
        def layerBatchSize = acceleratorParams.layer.layerBatchSize
        def layerNumOfSubVectors = acceleratorParams.layer.layerNumOfSubVectors
}


abstract class AcceleratorModule(implicit val p: Parameters) extends Module
	with HasLSHParameters
	with HasFPUParameters

abstract class AcceleratorBundle(implicit val p: Parameters) extends ParameterizedBundle()(p)
	with HasLSHParameters
	with HasFPUParameters

class ParameterizedBundle(implicit p: Parameters) extends Bundle

abstract class ParameterizedBlackBox(implicit val p: Parameters) extends BlackBox
	with HasAcceleratorParams
	with HasLSHParameters
