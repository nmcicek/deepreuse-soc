package FPGA

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.subsystem._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.wrapper._
import deepreuse.memory._

import sifive.blocks.devices.uart._


class UARTModule(val c: UARTParams)(implicit p: Parameters) extends Module
{
  val io = IO(new Bundle {
    val port             = new UARTPortIO(c)
    val rxData           = Decoupled(Bits(width = c.dataBits))
    val txData           = Decoupled(Bits(width = c.dataBits)).flip()
  })

  def nInterrupts = 1

  val divisorInit = (p(AcceleratorKey).frequency/115200).toInt

  require(divisorInit != 0, "UART divisor wasn't initialized during instantiation")
  require(divisorInit >> c.divisorBits == 0, s"UART divisor reg (width $c.divisorBits) not wide enough to hold $divisorInit")

  val txm = Module(new UARTTx(c))
  val txq = Module(new Queue(txm.io.in.bits, c.nTxEntries))

  val rxm = Module(new UARTRx(c))
  val rxq = Module(new Queue(rxm.io.out.bits, c.nRxEntries))

  io.rxData <> rxq.io.deq
  txq.io.enq <> io.txData

  val div = Reg(init = UInt(divisorInit, c.divisorBits))

  private val stopCountBits = log2Up(c.stopBits)
  private val txCountBits = log2Floor(c.nTxEntries) + 1
  private val rxCountBits = log2Floor(c.nRxEntries) + 1

  val txen = Reg(init = Bool(false))
  val rxen = Reg(init = Bool(false))
  val txwm = Reg(init = UInt(0, txCountBits))
  val rxwm = Reg(init = UInt(0, rxCountBits))
  val nstop = Reg(init = UInt(0, stopCountBits))

  txm.io.en := true.B //txen
  txm.io.in <> txq.io.deq
  txm.io.div := div
  txm.io.nstop := nstop
  io.port.txd := txm.io.out

  rxm.io.en := true.B //rxen
  rxm.io.in := io.port.rxd
  rxq.io.enq <> rxm.io.out
  rxm.io.div := div

  val ie = Reg(init = new UARTInterrupts().fromBits(Bits(0)))
  val ip = Wire(new UARTInterrupts)

  ip.txwm := (txq.io.count < txwm)
  ip.rxwm := (rxq.io.count > rxwm)

}