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


class DefaultAcceleratorConfig extends Config((site, here, up) => {
  case XLen => 64
  case AcceleratorKey => AcceleratorParams(
    frequency = BigInt(50000000),
    lsh  = LSHParams(maxHashSize = 15, maxVectorDim = 10, numOfHashTables = 1, maxNumOfInputs = 102400, dataSize = 8, countSize = 8, fpuEnabled = false),
    fpu  = FPUParams(dataSize = 8, integerToFloatLatency = 5, mulAddLatency = 5, lshMulLatency = 8, lshAddLatency = 11, divLatency = 28),
    layer = LayerParams(layerHashSize = 15, layerVectorDim = 5, layerBatchSize = 100, layerNumOfInputs = 1024, layerNumOfSubVectors = 15, layerNum = 0, subVectorNum = 0)
  )
  case PeripheryUARTKey => UARTParams(
    address = BigInt(0x10000000), 
    dataBits = 8, 
    stopBits = 1, 
    divisorBits = 16, 
    oversample = 4, 
    nSamples = 3, 
    nTxEntries = 8, 
    nRxEntries = 8
  )
})

class CIFARNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 15, maxVectorDim = 10, numOfHashTables = 1, maxNumOfInputs = 102400, dataSize = 8, countSize = 32, fpuEnabled = false),
  )
})

class ALEXNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 16, maxVectorDim = 24, numOfHashTables = 1, maxNumOfInputs = 291600, dataSize = 8, countSize = 32, fpuEnabled = false),
  )
})

class VGGNETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 20, maxVectorDim = 18, numOfHashTables = 1, maxNumOfInputs = 802816, dataSize = 8, countSize = 32, fpuEnabled = false),
  )
})

class MOBILENETAcceleratorConfig extends Config((site, here, up) => {
  case AcceleratorKey => up(AcceleratorKey, site).copy(
    lsh  = LSHParams(maxHashSize = 18, maxVectorDim = 16, numOfHashTables = 1, maxNumOfInputs = 50176, dataSize = 8, countSize = 32, fpuEnabled = false),
  )
})

class withUartWrapper extends Config((site, here, up) => {
  case UartEnabled => true
})

class withVerilator extends Config((site, here, up) => {
  case SimEnabled => true
})

//VERILATOR CONFIGS
class CIFARNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class CIFARNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class ALEXNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class ALEXNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class VGGNETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class VGGNETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class MOBILENETLSHAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new DefaultAcceleratorConfig)
class MOBILENETUARTAdvancedSimConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withVerilator ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

//FPGA CONFIGS
class CIFARNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class CIFARNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new CIFARNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class ALEXNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class ALEXNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new ALEXNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class VGGNETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class VGGNETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new VGGNETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)

class MOBILENETLSHAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new DefaultAcceleratorConfig)
class MOBILENETUARTAdvancedFPGAConfig extends Config(new WithoutTLMonitors ++ new MOBILENETAcceleratorConfig ++ new withUartWrapper ++ new DefaultAcceleratorConfig)
