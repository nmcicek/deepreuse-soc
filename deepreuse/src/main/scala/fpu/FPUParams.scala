package deepreuse.fpu

import deepreuse.common._

case class FPUParams(
	dataSize: Int = 32,
	integerToFloatLatency: Int = 5,
	mulAddLatency: Int = 5,
	lshMulLatency: Int = 8,
	lshAddLatency: Int = 11,
  centAddLatency: Int = 5,
	divLatency: Int = 28
)

trait HasFPUParameters extends HasAcceleratorParams {
  val fpuParams = acceleratorParams.fpu

  def lshMulLatency = fpuParams.lshMulLatency
  def lshAddLatency = fpuParams.lshAddLatency
  def centAddLatency = fpuParams.centAddLatency
  def divLatency = fpuParams.divLatency
  def mulAddLatency = fpuParams.mulAddLatency
  def integerToFloatLatency = fpuParams.integerToFloatLatency

  require(acceleratorParams.lsh.dataSize == fpuParams.dataSize, "dataSize is not equal for fpu and accelerator")
}

