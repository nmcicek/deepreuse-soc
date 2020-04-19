package lsh

import chisel3.iotesters.PeekPokeTester

import scala.util.Random
import scala.math.pow

class HashUnitTester(c: Hash) extends PeekPokeTester(c) {

  private val hash = c
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
      poke(hash.io.planes.bits(i)(j), planes(i)(j))
    }
  }
  poke(hash.io.planes.valid, 1)


  for(i <- 0 until params.maxNumOfInputs by 1) {
    for (j <- 0 until params.maxVectorDim by 1) {
      poke(hash.io.inputData.bits(j), input_point(i)(j))
    }
    poke(hash.io.inputData.valid, 1)

    step(1)
    var expected_key = 0
    for(j <- 0 until params.maxHashSize by 1) {
      implicit def toDot[T: Numeric](v1: Seq[T]) = new Dot(v1)
      val expected_dot = planes(j) dot input_point(i)
      if (expected_dot > 0) expected_key = expected_key + pow(2,j).toInt
    }
    expect(hash.io.key.bits, expected_key)
  }
}
