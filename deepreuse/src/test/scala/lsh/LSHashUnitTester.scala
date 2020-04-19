package lsh

import chisel3.iotesters.PeekPokeTester

import scala.util.Random

class LSHashUnitTester(c: LSH) extends PeekPokeTester(c) {

  def toDouble: (Any) => Double = { case i: Int => i case f: Float => f case d: Double => d }

  val params = new Parameters
  val rand = new Random()

  private val lsh = c
  private val lshInt = new LSHashInt(params.maxHashSize, params.maxVectorDim)

  val input_point = Vector.fill(params.maxNumOfInputs, params.maxVectorDim)(rand.nextInt() % 100)
  val planes = Vector.fill(params.numOfHashTables, params.maxHashSize, params.maxVectorDim)(rand.nextInt() % 100)
  val hash_tables = lshInt.init_hashtables
  var expectedMap = Seq(Map[Seq[Int], Seq[Seq[Int]]]())

  for (p <-0 until params.numOfHashTables){
    for(i <- 0 until params.maxHashSize by 1) {
      for (j <- 0 until params.maxVectorDim by 1) {
        poke(lsh.io.hash_table.bits(i)(j), planes(p)(i)(j))
      }
    }
    poke(lsh.io.hash_table.valid, 1)

    for(i <- 0 until params.maxNumOfInputs by 1) {
      for (j <- 0 until params.maxVectorDim by 1) {
        //poke(lsh.io.input_point.bits(i)(j), input_point(i)(j))
      }
    }
    //poke(lsh.io.input_point.valid, 1)

    step(1)

    for(i <- 0 until params.maxNumOfInputs by 1) {
      expectedMap = lshInt.index(expectedMap, planes, hash_tables, input_point(i), Option(1))
    }
    println(expectedMap.toString())

    val expectedKeys = expectedMap.head.keys
    val expectedKeysOH = Array.fill(math.pow(2,params.maxHashSize).toInt)(0)

    for ((key, i) <- expectedKeys.zipWithIndex) {
      expectedKeysOH(Integer.parseInt(key.reverse.mkString, 2)) = 1
    }


    println(expectedKeysOH.toList.reverse.toString)

    //expect(lsh.io.validKeys, Integer.parseInt(expectedKeysOH.toList.reverse.mkString,2))

  }
}
