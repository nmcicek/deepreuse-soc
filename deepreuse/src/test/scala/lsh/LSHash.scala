package lsh

class LSHash(hash_size:Int, input_dim: Int, num_hashtables: Int = 1) {


  def init_uniform_planes:Seq[Seq[Seq[Double]]] = {

    for(i<-0 until num_hashtables) yield generate_uniform_planes
  }

  def generate_uniform_planes: Seq[Seq[Double]] = {

    val rand = scala.util.Random
    Vector.fill(hash_size, input_dim)(rand.nextGaussian())
  }

  def init_hashtables: Seq[Storage[Seq[Int], Seq[Double]]] = {

    for(i<-0 until num_hashtables) yield new Storage[Seq[Int], Seq[Double]]
  }

  def index(dict: Seq[Map[Seq[Int], Seq[Seq[Double]]]],
            uniform_planes: Seq[Seq[Seq[Double]]],
            hash_table: Seq[Storage[Seq[Int], Seq[Double]]],
            input_point: Seq[Double],
            extra_data: Option[Double] = None): Seq[Map[Seq[Int], Seq[Seq[Double]]]] = {

    val value = extra_data match {
      case Some(data) => input_point ++ Seq(data)
      case None => input_point
    }
    for((table, i) <- hash_table.zipWithIndex) yield {
      table.append_val(dict(i), hash(uniform_planes(i), input_point), value)
    }
  }

  implicit def toDot[T: Numeric](v1: Seq[T]) = new Dot(v1)
  def hash[A](planes: Seq[Seq[Double]], input_point: Seq[Double]): Seq[Int] = {

    val projections = for( i<- planes.indices) yield planes(i) dot input_point
    val retVal = for ((projection, _) <- projections.zipWithIndex ) yield {
      if(projection > 0) 1 else 0
    }
    retVal
  }

}

object LSHashTest extends App{

  val hash_size = 3
  val input_dim = 4
  val height_dim = 5
  val depth_dim = 6

  val rand = scala.util.Random

  val lsh = new LSHash(hash_size,depth_dim)
  val uniform_planes = lsh.init_uniform_planes
  val hash_tables = lsh.init_hashtables

  val input_point1 = Vector.fill(depth_dim)(rand.nextDouble())
  val input_point2 = Vector.fill(depth_dim)(rand.nextDouble())
  val input_point3 = Vector.fill(depth_dim)(rand.nextDouble())
  val input_point4 = Vector.fill(depth_dim)(rand.nextDouble())
  val input_point5 = Vector.fill(depth_dim)(rand.nextDouble())


  val emptyMap = Seq(Map[Seq[Int], Seq[Seq[Double]]]())
  println(emptyMap)
  val map1 = lsh.index(emptyMap,uniform_planes, hash_tables, input_point1, Option(1.0))
  println(map1)
  val map2 = lsh.index(map1, uniform_planes, hash_tables, input_point2, Option(2.0))
  println(map2)
  val map3 = lsh.index(map2, uniform_planes, hash_tables, input_point3, Option(3.0))
  println(map3)
  val map4 = lsh.index(map3, uniform_planes, hash_tables, input_point4, Option(4.0))
  println(map4)
  val map5 = lsh.index(map4, uniform_planes, hash_tables, input_point5, Option(5.0))
  println(map5)

  val deepReuse = new DeepReuse
  val conv_in = Vector.fill(input_dim, height_dim, depth_dim)(rand.nextDouble())
  val input_shape = input_dim :: height_dim :: depth_dim :: Nil
  val dim_cluster_num = 3

  conv_in.foreach(println)
  val (centroid, label) =deepReuse.clusterLSH(conv_in, input_shape, dim_cluster_num, HashMap = map4)

  println("Printing centroid and label for clusterLSH")
  centroid.foreach(println)
  label.foreach(println)

  conv_in.foreach(println)
  val (centroid2, label2) = deepReuse.clusterLSHNorm(conv_in, input_shape, dim_cluster_num, HashMap = map4)

  println("Printing centroid and label for clusterLSHNorm")
  centroid2.foreach(println)
  label2.foreach(println)

/*
  val input_dir = "src/resources/cifar10/layers/"
  val in_name = input_dir + "conv1" + "in/"+"conv1"+"in_1.csv"
  deepReuse.conv_layer("conv1", 5 :: 1 :: 2 :: Nil, in_name, "cluster", "channel_LSH", 1, 5)

*/



}

