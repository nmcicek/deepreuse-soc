package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.Parameters

import deepreuse.common._


class Index(implicit p: Parameters) extends AcceleratorModule {

  val io = new Bundle {
    val inputData          = Input(Valid(Vec(maxVectorDim, UInt(dataSize.W))))
    val hash_table         = Input(Valid(Vec(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))))
    val key                = Output(Valid(UInt(maxHashSize.W)))
    val hashConfReg        = Input(UInt())
    val dimConfReg         = Input(UInt())
    val enable             = Input(Bool())
  }


  val hashModule = Module(new Hash)
  hashModule.io.inputData := io.inputData
  hashModule.io.planes := io.hash_table
  hashModule.io.hashConfReg := io.hashConfReg
  hashModule.io.dimConfReg := io.dimConfReg
  hashModule.io.enable := io.enable

  io.key := hashModule.io.key
}
