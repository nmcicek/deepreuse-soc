// See LICENSE for license details.
package fpgashells.devices.xilinx.xilinxvcu118mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}
import freechips.rocketchip.tilelink._

import deepreuse.wrapper._
import deepreuse.lsh._
import deepreuse.memory._


trait HasMemoryXilinxVCU118MIG extends BaseWrapper {
  val module: HasMemoryXilinxVCU118MIGModuleImp

  val xilinxvcu118mig = LazyModule(new XilinxVCU118MIG(p(MemoryXilinxDDRKey)))

  val cacheRowBytes = p(ClusterCacheKey).rowBits/8
  require(p(ClusterCacheKey).rowBits == p(IDCacheKey).rowBits)

  val BroadcastParams(nTrackers, bufferless) = p(BroadcastKey)
  val lineBytes = p(MemoryBusKey).beatBytes
  val cacheBlockBytes = p(MemoryBusKey).blockBytes
  val bh = LazyModule(new TLBroadcast(lineBytes, nTrackers, bufferless))  
  val ww = LazyModule(new TLWidthWidget(cacheRowBytes))

  if(p(Advanced)) xilinxvcu118mig.node := TLFragmenter(lineBytes, cacheBlockBytes) := bh.node := ww.node := lsh.common_node.node else xilinxvcu118mig.node := lsh.masterNode

}

trait HasMemoryXilinxVCU118MIGBundle {
  val xilinxvcu118mig: XilinxVCU118MIGIO
  def connectXilinxVCU118MIGToPads(pads: XilinxVCU118MIGPads) {
    pads <> xilinxvcu118mig
  }
}

trait HasMemoryXilinxVCU118MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxVCU118MIGBundle {
  val outer: HasMemoryXilinxVCU118MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size
  val xilinxvcu118mig = IO(new XilinxVCU118MIGIO(depth))

  xilinxvcu118mig <> outer.xilinxvcu118mig.module.io.port
}
