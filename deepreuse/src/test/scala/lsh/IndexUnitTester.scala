package lsh

import chisel3.iotesters.PeekPokeTester

import scala.math.pow
import scala.util.Random

class IndexUnitTester(c: Index) extends PeekPokeTester(c) {

  def toDouble: (Any) => Double = { case i: Int => i case f: Float => f case d: Double => d }

  val params = new Parameters
  val rand = new Random()

  private val index = c

  val input_point = Vector.fill(params.maxNumOfInputs, params.maxVectorDim)(rand.nextInt() % 100)
  val planes = Vector.fill(params.numOfHashTables, params.maxHashSize, params.maxVectorDim)(rand.nextInt() % 100)

  input_point.foreach(print)
  print("\n")
  planes.foreach(print)
  print("\n")

  for (p <-0 until params.numOfHashTables){
    for(i <- 0 until params.maxHashSize by 1) {
      for (j <- 0 until params.maxVectorDim by 1) {
        poke(index.io.hash_table.bits(i)(j), planes(p)(i)(j))
      }
    }
    poke(index.io.hash_table.valid, 1)

    for(i <- 0 until params.maxNumOfInputs by 1) {
      for (j <- 0 until params.maxVectorDim by 1) {
        poke(index.io.inputData.bits(i)(j), input_point(i)(j))
      }
      poke(index.io.inputData.valid, 1)

      //poke(index.io.extra_data, i)

      var expected_key = 0
      for(j <- 0 until params.maxHashSize by 1) {
        implicit def toDot[T: Numeric](v1: Seq[T]) = new Dot(v1)
        val expected_dot = planes(p)(j) dot input_point(i)
        if (expected_dot > 0) expected_key = expected_key + pow(2,j).toInt
      }

      expect(index.io.key.bits, expected_key)

      val expected_extraOut = input_point(i) ++ Seq(i)
      //for(j <- 0 until params.maxVectorDim + 1)
        //expect(index.io.input_point_wExtra(j), expected_extraOut(j))
    }
  }



}
