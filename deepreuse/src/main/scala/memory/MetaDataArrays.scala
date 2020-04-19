package deepreuse.memory

import Chisel._

import freechips.rocketchip.tilelink._
import freechips.rocketchip.config.{Parameters, Field}

import deepreuse.common._


class ClusterCacheMetadataArray[T <: CCMetadata](onReset: () => T)(implicit val p: Parameters) extends Module with ClusterCacheParameters {
  val rstVal = onReset()
  val io = new Bundle {
    val read = Decoupled(new CCMetaReadReq).flip
    val write = Decoupled(new CCMetaWriteReq).flip
    val resp = Vec(nWays, rstVal.cloneType).asOutput
  }

  io.suggestName("CCMetadataArrayIO")

  val rst_cnt = Reg(init=UInt(0, log2Up(nSets+1)))
  val rst = rst_cnt < UInt(nSets)
  val waddr = Mux(rst, rst_cnt, io.write.bits.idx)
  val wdata = Mux(rst, rstVal, io.write.bits.data).asUInt
  val wmask = Mux(rst || Bool(nWays == 1), SInt(-1), io.write.bits.way_en.asSInt).asBools
  val rmask = Mux(rst || Bool(nWays == 1), SInt(-1), io.read.bits.way_en.asSInt).asBools
  when (rst) { rst_cnt := rst_cnt+UInt(1) }

  val metabits = rstVal.getWidth
  val tag_array = SeqMem(nSets, Vec(nWays, UInt(width = metabits)))
  val wen = rst || io.write.valid
  when (wen) {
    tag_array.write(waddr, Vec.fill(nWays)(wdata), wmask)
  }
  io.resp := tag_array.read(io.read.bits.idx, io.read.fire()).map(rstVal.fromBits(_))

  io.read.ready := !wen // so really this could be a 6T RAM
  io.write.ready := !rst
}

class IDCacheMetadataArray[T <: ICMetadata](onReset: () => T)(implicit val p: Parameters) extends Module with IDCacheParameters {
  val rstVal = onReset()
  val io = new Bundle {
    val read = Decoupled(new ICMetaReadReq).flip
    val write = Decoupled(new ICMetaWriteReq).flip
    val resp = Vec(nWays, rstVal.cloneType).asOutput
  }

  io.suggestName("ICMetadataArrayIO")

  val rst_cnt = Reg(init=UInt(0, log2Up(nSets+1)))
  val rst = rst_cnt < UInt(nSets)
  val waddr = Mux(rst, rst_cnt, io.write.bits.idx)
  val wdata = Mux(rst, rstVal, io.write.bits.data).asUInt
  val wmask = Mux(rst || Bool(nWays == 1), SInt(-1), io.write.bits.way_en.asSInt).asBools
  val rmask = Mux(rst || Bool(nWays == 1), SInt(-1), io.read.bits.way_en.asSInt).asBools
  when (rst) { rst_cnt := rst_cnt+UInt(1) }

  val metabits = rstVal.getWidth
  val tag_array = SeqMem(nSets, Vec(nWays, UInt(width = metabits)))
  val wen = rst || io.write.valid
  when (wen) {
    tag_array.write(waddr, Vec.fill(nWays)(wdata), wmask)
  }
  io.resp := tag_array.read(io.read.bits.idx, io.read.fire()).map(rstVal.fromBits(_))

  io.read.ready := !wen // so really this could be a 6T RAM
  io.write.ready := !rst
}
