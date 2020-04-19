package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.Parameters

import deepreuse.fpu._
import deepreuse.common._


class DOT(implicit p: Parameters) extends AcceleratorModule {

  val io = new Bundle {
    val inputData          = Input(Valid(Vec(maxVectorDim, UInt(dataSize.W))))
    val hash_table         = Input(Valid(Vec(maxHashSize, Vec(maxVectorDim, UInt(dataSize.W)))))
    val result             = Output(Valid(Vec(maxHashSize, UInt(dataSize.W))))
    val hashConfReg        = Input(UInt())
    val dimConfReg         = Input(UInt())
    val enable             = Input(Bool())
  }

  if(DEBUG_PRINTF_LSH){
    when(io.inputData.valid){
      for (i<-0 until maxVectorDim)
        printf("---DOT--- inputData(%d): 0x%x\n", i.U, io.inputData.bits(i))
    }

    when(io.result.valid){
      for (i<-0 until maxHashSize)
        printf("---DOT--- result(%d): 0x%x\n", i.U, io.result.bits(i))
    }
  }
  
  val vector_size = maxVectorDim + (0 until log2Up(maxVectorDim)).foldLeft(0)((a,b) => a + math.ceil(maxVectorDim/math.pow(2,b)).toInt) + 1
  val intPipeNode = Wire(Vec(maxHashSize, Vec(vector_size, Valid(UInt(dataSize.W)))))
  var outIndex = collection.mutable.ArrayBuffer.fill(maxHashSize)(0)
  var inIndex = collection.mutable.ArrayBuffer.fill(maxHashSize)(0)


  for(i <-0 until maxHashSize) {
    for(j <- 0 until vector_size) {
      intPipeNode(i)(j).bits := 0.U
      intPipeNode(i)(j).valid := false.B
    }
  }


  for(k <-0 to log2Up(maxVectorDim)) {

    /*------FIRST STAGE-------*/
    if(k == 0){
      for (i <- 0 until maxHashSize) {
        for(j <- 0 until maxVectorDim) {

          if(fpuEnabled){
            val fpuMulModule = Module(new FPUMul)
            fpuMulModule.io.aclk := clock
            fpuMulModule.io.s_axis_a_tvalid := io.hash_table.valid
            fpuMulModule.io.s_axis_a_tdata := io.hash_table.bits(i)(j)
            fpuMulModule.io.s_axis_b_tvalid := io.inputData.valid
            fpuMulModule.io.s_axis_b_tdata := Mux(j.U < io.dimConfReg, io.inputData.bits(j), 0.U)
            if(p(SimEnabled)){
              val delayed = Pipe(fpuMulModule.io.m_axis_result_tvalid.toBool, 
                                 fpuMulModule.io.m_axis_result_tdata, 
                                 lshMulLatency,
                                 io.enable)
              intPipeNode(i)(outIndex(i)).valid := delayed.valid
              intPipeNode(i)(outIndex(i)).bits := delayed.bits
            }else{
              intPipeNode(i)(outIndex(i)).valid := fpuMulModule.io.m_axis_result_tvalid
              intPipeNode(i)(outIndex(i)).bits := fpuMulModule.io.m_axis_result_tdata
            }
          }
          else{
            intPipeNode(i)(outIndex(i)) := Pipe(io.inputData.valid && io.hash_table.valid, 
                                                io.hash_table.bits(i)(j) * Mux(j.U < io.dimConfReg, io.inputData.bits(j), 0.U),
                                                1,
                                                io.enable)
          }
          outIndex(i) = outIndex(i) + 1
          //println("Mul")
        }
      }
    }
    /*------OTHER STAGES-------*/
    else{
      val numberOfModules = math.ceil(maxVectorDim/math.pow(2,k)).toInt
      val finalStage = maxVectorDim/math.pow(2,k).toInt == 0
      //println(numberOfModules)

      for(i <- 0 until maxHashSize) {
        for (j <- 0 until numberOfModules) {

          if((j < maxVectorDim/math.pow(2,k).toInt) || finalStage){
            //println("Adder")
            if(fpuEnabled){
              val fpuAddModule = Module(new FPUAdd)
              fpuAddModule.io.aclk := clock
              fpuAddModule.io.s_axis_a_tdata := intPipeNode(i)(inIndex(i)).bits
              fpuAddModule.io.s_axis_a_tvalid := intPipeNode(i)(inIndex(i)).valid
              fpuAddModule.io.s_axis_b_tdata := intPipeNode(i)(inIndex(i) + 1).bits
              fpuAddModule.io.s_axis_b_tvalid := intPipeNode(i)(inIndex(i) + 1).valid
              if(p(SimEnabled)){
                val delayed = Pipe(fpuAddModule.io.m_axis_result_tvalid.toBool, 
                                   fpuAddModule.io.m_axis_result_tdata, 
                                   lshAddLatency,
                                   io.enable)
                intPipeNode(i)(outIndex(i)).valid := delayed.valid
                intPipeNode(i)(outIndex(i)).bits := delayed.bits
              }else{
                intPipeNode(i)(outIndex(i)).valid := fpuAddModule.io.m_axis_result_tvalid
                intPipeNode(i)(outIndex(i)).bits := fpuAddModule.io.m_axis_result_tdata   
              }
            }
            else{
              intPipeNode(i)(outIndex(i)) := Pipe(intPipeNode(i)(inIndex(i)).valid && intPipeNode(i)(inIndex(i) + 1).valid, 
                                                  intPipeNode(i)(inIndex(i)).bits + intPipeNode(i)(inIndex(i) + 1).bits, 
                                                  1,
                                                  io.enable)
            }
            outIndex(i) = outIndex(i) + 1
            inIndex(i) = inIndex(i) + 2
          }else{
            //println("Pipe")
            if(fpuEnabled){
              intPipeNode(i)(outIndex(i)) := Pipe(intPipeNode(i)(inIndex(i)).valid, 
                                                  intPipeNode(i)(inIndex(i)).bits, 
                                                  lshAddLatency,
                                                  io.enable)
            }
            else{
              intPipeNode(i)(outIndex(i)) := Pipe(intPipeNode(i)(inIndex(i)).valid, 
                                                  intPipeNode(i)(inIndex(i)).bits, 
                                                  1,
                                                  io.enable)
            }
            outIndex(i) = outIndex(i) + 1
            inIndex(i) = inIndex(i) + 1
          }
        }
      }
    }
  }


  val allValids = Wire(Vec(maxHashSize, UInt(1.W)))
  for(i<-0 until maxHashSize){
    io.result.bits(i) := intPipeNode(i)(outIndex(i) - 1).bits
    allValids(i) := intPipeNode(i)(outIndex(i) - 1).valid
  }

  io.result.valid := allValids.foldLeft(1.U)(_ & _)
}
