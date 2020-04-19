// See LICENSE for license details.
package fpgashells.devices.xilinx.xilinxkc705mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.tilelink._

import deepreuse.wrapper._
import deepreuse.lsh._
import deepreuse.memory._


trait HasMemoryXilinxKC705MIG extends BaseWrapper {
  val module: HasMemoryXilinxKC705MIGModuleImp

  val xilinxkc705mig = LazyModule(new XilinxKC705MIG(p(MemoryXilinxDDRKey)))

  val cacheRowBytes = p(ClusterCacheKey).rowBits/8
  require(p(ClusterCacheKey).rowBits == p(IDCacheKey).rowBits)

  val BroadcastParams(nTrackers, bufferless) = p(BroadcastKey)
  val lineBytes = p(MemoryBusKey).beatBytes
  val cacheBlockBytes = p(MemoryBusKey).blockBytes
  val bh = LazyModule(new TLBroadcast(lineBytes, nTrackers, bufferless))  
  val ww = LazyModule(new TLWidthWidget(cacheRowBytes))

  if(p(Advanced)) xilinxkc705mig.node := TLFragmenter(lineBytes, cacheBlockBytes) := bh.node := ww.node := lsh.common_node.node else xilinxkc705mig.node := lsh.masterNode

}

trait HasMemoryXilinxKC705MIGBundle {
  val xilinxkc705mig: XilinxKC705MIGIO
  def connectXilinxKC705MIGToPads(pads: XilinxKC705MIGPads) {
    pads <> xilinxkc705mig
  }
}

trait HasMemoryXilinxKC705MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxKC705MIGBundle {
  val outer: HasMemoryXilinxKC705MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size
  val xilinxkc705mig = IO(new XilinxKC705MIGIO(depth))

  xilinxkc705mig <> outer.xilinxkc705mig.module.io.port
}
