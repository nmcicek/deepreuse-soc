package deepreuse.memory

import Chisel._

import freechips.rocketchip.config.{Parameters, Field}
import deepreuse.common._


class ClusterCacheDataArray(implicit val p: Parameters) extends Module with ClusterCacheParameters {
  val io = new Bundle {
    val read = Decoupled(new CCDataReadReq).flip
    val write = Decoupled(new CCDataWriteReq).flip
    val resp = Vec(nWays, Bits(OUTPUT, rowBits))
  }

  io.suggestName("ClusterCacheDataArrayIO")

  println("***** CLUSTER CACHE ******")
  println("nSets: "+nSets)
  println("nWays: "+nWays)
  println("rowBits: "+rowBits)
  println("rowWords: "+rowWords)
  println("wordBits: "+wordBits)
  println("blockBytes: "+cacheBlockBytes+"\n")

  val waddr = io.write.bits.addr >> rowOffBits
  val raddr = io.read.bits.addr >> rowOffBits

  for (w <- 0 until nWays) {
    val array = SeqMem(nSets*refillCycles, Vec(rowWords, Bits(width=wordBits)))
    when (io.write.bits.way_en(w) && io.write.valid) {
      val data = Vec.tabulate(rowWords)(i => io.write.bits.data(wordBits*(i+1)-1, wordBits*i))
      array.write(waddr, data, io.write.bits.wmask.asBools)
    }
    io.resp(w) := array.read(raddr, io.read.bits.way_en(w) && io.read.valid).asUInt
  }

  io.read.ready := Bool(true)
  io.write.ready := Bool(true)
}

class IDCacheDataArray(implicit val p: Parameters) extends Module with IDCacheParameters {
  val io = new Bundle {
    val read = Decoupled(new ICDataReadReq).flip
    val write = Decoupled(new ICDataWriteReq).flip
    val resp = Vec(nWays, Bits(OUTPUT, rowBits))
  }

  io.suggestName("IDCacheDataArrayIO")

  println("***** ID CACHE ******")
  println("nSets: "+nSets)
  println("nWays: "+nWays)
  println("rowBits: "+rowBits)
  println("rowWords: "+rowWords)
  println("wordBits: "+wordBits)
  println("blockBytes: "+cacheBlockBytes+"\n")

  val waddr = io.write.bits.addr >> rowOffBits
  val raddr = io.read.bits.addr >> rowOffBits

  for (w <- 0 until nWays) {
    val array = SeqMem(nSets*refillCycles, Vec(rowWords, Bits(width=wordBits)))
    when (io.write.bits.way_en(w) && io.write.valid) {
      val data = Vec.tabulate(rowWords)(i => io.write.bits.data(wordBits*(i+1)-1, wordBits*i))
      array.write(waddr, data, io.write.bits.wmask.asBools)
    }
    io.resp(w) := array.read(raddr, io.read.bits.way_en(w) && io.read.valid).asUInt
  }

  io.read.ready := Bool(true)
  io.write.ready := Bool(true)
}
