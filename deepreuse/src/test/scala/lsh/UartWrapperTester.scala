package lsh

import chisel3.iotesters.PeekPokeTester

class UartWrapperTester(c: UartWrapper) extends PeekPokeTester(c) {

  step(1)
}
