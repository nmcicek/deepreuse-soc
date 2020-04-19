package deepreuse.memory

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._

import deepreuse.lsh._

case object ClusterCacheKey extends Field[ClusterCacheParams]
case object IDCacheKey extends Field[IDCacheParams]

case class ClusterCacheParams(
  nSets: Int,
  nWays: Int,
  nMSHRs: Int,
  nSDQ: Int,
  nRPQ: Int,
  rowBits: Int)

trait ClusterCacheParameters extends HasLSHParameters{
  implicit val p: Parameters
  def clusterCacheParams: ClusterCacheParams = p(ClusterCacheKey)

  def rowBits = clusterCacheParams.rowBits //should be same with bus width
  def rowBytes = rowBits/8 //32
  def rowOffBits = log2Up(rowBytes) //5

  def wordBits = math.pow(2, log2Up(countSize + maxVectorDim*dataSize)).toInt //128
  def wordBytes = wordBits/8 //16
  def wordOffBits = log2Up(wordBytes) //4

  def rowWords = rowBits/wordBits //2

  def nSets = clusterCacheParams.nSets // 32
  def nWays = clusterCacheParams.nWays // 8
  def cacheBlockBytes = p(MemoryBusKey).blockBytes //64
  def cacheDataBeats = cacheBlockBytes / rowBytes // 2
  def refillCycles = cacheDataBeats // 2

  def lgCacheBlockBytes = log2Up(cacheBlockBytes) //6
  def blockOffBits = lgCacheBlockBytes // 6
  def idxLSB = blockOffBits //6
  def offsetmsb = blockOffBits-1 //5
  def offsetlsb = wordOffBits //5

  def idxBits = log2Up(nSets) //5
  def untagBits = blockOffBits + idxBits //11
  def tagBits = 32 - untagBits //physical address - untagBits
  def idxMSB = untagBits-1 //10
  
  def nMSHRs = clusterCacheParams.nMSHRs
  def nSDQ = clusterCacheParams.nSDQ
  def nRPQ = clusterCacheParams.nRPQ
}

case class IDCacheParams(
  nSets: Int,
  nWays: Int,
  nMSHRs: Int,
  nSDQ: Int,
  nRPQ: Int,
  rowBits: Int)

trait IDCacheParameters extends HasLSHParameters{
  implicit val p: Parameters
  def idCacheParams: IDCacheParams = p(IDCacheKey)

  def rowBits = idCacheParams.rowBits //should be same with bus width
  def rowBytes = rowBits/8 //32
  def rowOffBits = log2Up(rowBytes) //5

  def wordBits = math.pow(2, log2Up(maxHashSize)).toInt //128
  def wordBytes = wordBits/8 //16
  def wordOffBits = log2Up(wordBytes) //4

  def rowWords = rowBits/wordBits //2

  def nSets = idCacheParams.nSets // 32
  def nWays = idCacheParams.nWays // 8
  def cacheBlockBytes = p(MemoryBusKey).blockBytes //64
  def cacheDataBeats = cacheBlockBytes / rowBytes // 4
  def refillCycles = cacheDataBeats // 4
  
  def lgCacheBlockBytes = log2Up(cacheBlockBytes) //6
  def blockOffBits = log2Up(cacheBlockBytes) // 6
  def idxLSB = blockOffBits //6
  def offsetmsb = blockOffBits-1 //5
  def offsetlsb = wordOffBits //4

  def idxBits = log2Up(nSets) //5
  def untagBits = blockOffBits + idxBits //11
  def tagBits = 32 - untagBits //physical address - untagBits
  def idxMSB = untagBits-1 //10

  def nMSHRs = idCacheParams.nMSHRs
  def nSDQ = idCacheParams.nSDQ
  def nRPQ = idCacheParams.nRPQ
}


object CacheOpConsts {
  val read = UInt(0x4)
  val write = UInt(0x0)
}
