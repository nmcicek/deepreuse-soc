package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.Parameters

import deepreuse.common._


class Hash(implicit p: Parameters) extends AcceleratorModule {

  val io = new Bundle {
    val inputData          = Input(Valid(Vec(maxVectorDim, UInt(dataSize.W))))
    val planes             = Input(Valid(Vec(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))))
    val key                = Output(Valid(UInt(maxHashSize.W)))
    val hashConfReg        = Input(UInt())
    val dimConfReg         = Input(UInt())
    val enable             = Input(Bool())
  }

  val dotProductModule = Module(new DOT)
  dotProductModule.io.inputData := io.inputData
  dotProductModule.io.hash_table := io.planes
  dotProductModule.io.hashConfReg := io.hashConfReg
  dotProductModule.io.dimConfReg := io.dimConfReg
  dotProductModule.io.enable := io.enable
  val projections = dotProductModule.io.result

  val result = Wire(Vec(maxHashSize,UInt(width = 1)))
  for ((projection, i) <- projections.bits.zipWithIndex ) {
    result(i) := Mux(i.U < io.hashConfReg, ~projection(2*dataSize-1), 0.U)
  }

  io.key.bits := result.asUInt()
  io.key.valid := projections.valid
}
