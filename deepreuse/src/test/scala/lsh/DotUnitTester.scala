package lsh

import chisel3.iotesters.PeekPokeTester

import scala.util.Random

class DotUnitTester(c: DOT) extends PeekPokeTester(c) {

  private val dot = c
  val rand = new Random()
  val params = new Parameters

  val input_point = Vector.fill(params.maxNumOfInputs, params.maxVectorDim)(rand.nextInt() % 100)
  val planes = Vector.fill(params.maxHashSize, params.maxVectorDim)(rand.nextInt() % 100)

  input_point.foreach(print)
  print("\n")
  planes.foreach(print)
  print("\n")

  for(i <- 0 until params.maxHashSize by 1) {
    for (j <- 0 until params.maxVectorDim by 1) {
      poke(dot.io.hash_table.bits(i)(j), planes(i)(j))
    }
  }
  poke(dot.io.hash_table.valid, 1)

  for(i <- 0 until params.maxNumOfInputs by 1) {
    for (j <- 0 until params.maxVectorDim by 1) {
      poke(dot.io.inputData.bits(j), input_point(i)(j))
    }
    poke(dot.io.inputData.valid, 1)

    for(j <- 0 until params.maxHashSize by 1) {
      implicit def toDot[T: Numeric](v1: Seq[T]) = new Dot(v1)
      val expected_dot = planes(j) dot input_point(i)
      expect(dot.io.result.bits(j), expected_dot)
    }
  }
}
