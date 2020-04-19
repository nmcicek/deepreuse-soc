package deepreuse.lsh

import Chisel._

import freechips.rocketchip.config.Parameters

import deepreuse.common._


class Delayer(nStage: Int)(implicit p: Parameters) extends AcceleratorModule {

  val io = IO(new Bundle {
    val data_in = Flipped(new ValidIO(new bufferEntry))
    val data_out = Vec(nStage, new ValidIO(new bufferEntry))
  })

  io.data_out(0) := Pipe(io.data_in.valid, io.data_in.bits, 1)
  for(i<-1 until nStage){
    io.data_out(i) := Pipe(io.data_out(i-1).valid, io.data_out(i-1).bits, 1)
  }
  io.suggestName("Delayer")
  
  if(DEBUG_PRINTF_LSH){
  	for(i<-0 until nStage){
  		when(io.data_out(i).valid){
        printf("hashID at stage %d is valid -> data: 0x%x\n", (i+1).U, io.data_out(i).bits.hashID)        
      }
    }
  }  
}
