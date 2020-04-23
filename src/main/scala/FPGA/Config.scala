package FPGA

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tile.XLen
import freechips.rocketchip.subsystem._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.fpu._
import deepreuse.memory._

import sifive.blocks.devices.uart._

import fpgashells.devices.xilinx.xilinxkc705mig._


class DefaultAcceleratorConfig extends Config((site, here, up) => {
  case XLen => 64
  case MemoryModelKey => AddressSet(0x80000000L,0x40000000L-1)
  case MemoryXilinxDDRKey => XilinxKC705MIGParams(address = Seq(AddressSet(0x80000000L,0x40000000L-1))) //1GB
  case AcceleratorKey => AcceleratorParams(
    frequency = BigInt(50000000),
    lsh  = LSHParams(maxHashSize = 20, maxVectorDim = 18, numOfHashTables = 1, maxNumOfInputs = 4096000, dataSize = 8, fpuEnabled = false),
    fpu  = FPUParams(dataSize = 8, integerToFloatLatency = 5, mulAddLatency = 5, lshMulLatency = 8, lshAddLatency = 11, divLatency = 28),
    layer = LayerParams(layerHashSize = 16, layerVectorDim = 11, layerBatchSize = 100, layerNumOfInputs = 2916, layerNumOfSubVectors = 33, layerNum = 0)
  )
  case BroadcastKey => BroadcastParams(nTrackers  = site(ClusterCacheKey).nMSHRs + site(IDCacheKey).nMSHRs, bufferless = false)
  case MemoryBusKey => MemoryBusParams(
    beatBytes = 8, 
    blockBytes = 128
  )
  case UartKey => UARTParams(
    address = None, 
    dataBits = 8, 
    stopBits = 1, 
    divisorInit = (site(AcceleratorKey).frequency/115200).toInt,
    divisorBits = 16, 
    oversample = 4, 
    nSamples = 3, 
    nTxEntries = 8, 
    nRxEntries = 8
  )
  case ClusterCacheKey => ClusterCacheParams(nSets = 64, nWays = 8, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = 256)
  case IDCacheKey => IDCacheParams(nSets = 64, nWays = 8, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = 256)
})

class CIFARNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 15, maxVectorDim = 10, numOfHashTables = 1, maxNumOfInputs = 4096000, dataSize = 8, countSize = 8),
  )
})

class ALEXNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 16, maxVectorDim = 24, numOfHashTables = 1, maxNumOfInputs = 9622800, dataSize = 8, countSize = 8),
  )
})

class VGGNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 20, maxVectorDim = 18, numOfHashTables = 1, maxNumOfInputs = 28901376, dataSize = 8, countSize = 8),
  )
})

class MOBILENETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 18, maxVectorDim = 16, numOfHashTables = 1, maxNumOfInputs = 451584, dataSize = 8, countSize = 8),
  )
})

class withUartWrapper extends Config((site, here, up) => {
  case UartEnabled => true
})

class withAdvancedLSH extends Config((site, here, up) => {
  case Advanced => true
})

class withVerilator extends Config((site, here, up) => {
  case SimEnabled => true
})

//VERILATOR CONFIGS
class CIFARNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class CIFARNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class CIFARNETLSHBasicSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class CIFARNETUARTBasicSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class ALEXNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class ALEXNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class ALEXNETLSHBasicSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class ALEXNETUARTBasicSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class VGGNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class VGGNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class VGGNETLSHBasicSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class VGGNETUARTBasicSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class MOBILENETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class MOBILENETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class MOBILENETLSHBasicSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class MOBILENETUARTBasicSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

//FPGA CONFIGS
class CIFARNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class CIFARNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class CIFARNETLSHBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class CIFARNETUARTBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class ALEXNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class ALEXNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class ALEXNETLSHBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class ALEXNETUARTBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class VGGNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class VGGNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class VGGNETLSHBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class VGGNETUARTBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class MOBILENETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class MOBILENETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withUartWrapper ++ new withAdvancedLSH ++ new DefaultAcceleratorConfig)
class MOBILENETLSHBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class MOBILENETUARTBasicFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)
