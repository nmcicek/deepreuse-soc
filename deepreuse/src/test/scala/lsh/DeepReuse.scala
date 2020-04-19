package lsh

import scala.math._
import scala.io.Source
import java.nio.file.Paths

class DeepReuse {

  /*
    dim_cluster_num => hash_size
   */

  def average(s: Seq[Double]): Double = { val t = s.foldLeft((0.0, 0)) ((acc, i) => (acc._1 + i, acc._2 + 1)); t._1 / t._2 }

  def clusterLSH(conv_in: Seq[Seq[Seq[Double]]], input_shape: Seq[Int], dim_cluster_num: Int, HashMap: Seq[Map[Seq[Int], Seq[Seq[Double]]]])  = {

    val input_dim = input_shape(2)
    val bucket_num = dim_cluster_num

    val lsh = new LSHash(bucket_num, input_dim)

    val label = Array.ofDim[Int](conv_in.length)
    val clusterKeys = HashMap.head.keys

    val centroid = for ((key, i) <- clusterKeys.zipWithIndex) yield{
      /*
      Label assignment
       */
      val points = HashMap.head(key)
      for((point, j) <- points.zipWithIndex){
        label((point.last - 1).toInt) = i
      }

      /*
      Get average in a list obtained from a key
       */
      val colPoints = points.transpose
      for (k<-0 until colPoints.length - 1) yield average(colPoints(k))
    }

    (centroid, label)
  }

  // this flavour is pure magic...
  def toDouble: (Any) => Double = { case i: Int => i case f: Float => f case d: Double => d }

  def clusterLSHNorm(conv_in: Seq[Seq[Seq[Double]]], input_shape: Seq[Int], dim_cluster_num: Int, HashMap: Seq[Map[Seq[Int], Seq[Seq[Double]]]])  = {

    val conv_in_norm = for (k <- conv_in.indices) yield {
                          for (m <- conv_in.head.head.indices) yield {
                              sqrt(conv_in(k).foldLeft(0.0)(_ + _(m)))
                          }
                       }

    val normed_conv_in = conv_in.zip(conv_in_norm).map { case (a, b) => for(a_sub <- a) yield a_sub.zip(b).map {case (c,d) => c.toDouble/d.toDouble } }

    val iw = input_shape.head
    val ih = input_shape(1)
    val kernel_dim = input_shape(2)

    val label = Array.ofDim[Int](normed_conv_in.length)

    val input_dim = kernel_dim
    val bucket_num = dim_cluster_num
    val lsh = new LSHash(bucket_num, input_dim)

    val clusterKeys = HashMap.head.keys

    val centroid = for ((key, i) <- clusterKeys.zipWithIndex) yield{
      /*
      Label assignment
       */
      val points = HashMap.head(key)
      for((point, j) <- points.zipWithIndex){
        label((point.last - 1).toInt) = i
      }

      /*
      Get average in a list obtained from a key
       */
      val colPoints = points.transpose
      for (k<-0 until colPoints.length - 1) yield average(colPoints(k))
    }

    (centroid, label)

  }

/*
  def matrixMult[A, CC[X] <: Seq[X], DD[Y] <: Seq[Y]](a: CC[DD[A]], b: CC[DD[A]]) (implicit n: Numeric[A]): CC[DD[A]] = {
    import n._
    for (row <- a) yield for(col <- b.transpose) yield row zip col map Function.tupled(_*_.asInstanceOf[A]) reduceLeft (_+_)
  }
*/
  /*
  def conv_cluster_channel_LSH(conv_in: Seq[Seq[Seq[Double]]], kernel: Seq[Seq[Seq[Double]]], bias: Seq[Double], out_dim: Seq[Int], method:String, ic:Int, dim_cluster_num: Int) = {
    // ic is the number of sub-vectors

    // compute the dimensions of the input sub-matrix
    val new_ih = conv_in.length
    val new_iw = conv_in.head.length/ic

    // compute the dimensions of the weight sub-matrix
    val new_kh = kernel.length/ic
    val new_kw = kernel.head.length

    val channel_conv_in = Array.ofDim[Double](ic, new_ih, new_iw)
    val new_kernel = Array.ofDim[Double](ic, new_kh, new_kw)

    // compute the output for each sub-matrix and add them together
    val conv_out = Array.ofDim[Double](new_ih, new_kw)
    val conv_out_temp = Array.ofDim[Double](new_ih, new_kw)


    for (i<-0 until ic){
      val channel_conv_in = conv_in.map(_.transpose.slice(i*new_iw,(i+1)*new_iw).transpose) //ic*new_ih*new_iw
      val new_kernel =  kernel.map(_.slice(i*new_kh,(i+1)*new_kh)) //ic*new_kh*new_kw

      val new_conv_in = channel_conv_in(i)
      // using LSH to cluster the input sub-vectors, return the centroids and the labels of all the sub-vectors
      val centroidAndLabel = method match {
        case "channel_LSH" => clusterLSH(new_conv_in, out_dim.head :: out_dim(1) :: ic :: Nil, dim_cluster_num)
        case "channel_LSH_norm" => clusterLSHNorm(new_conv_in, out_dim.head :: out_dim(1) :: ic :: Nil, dim_cluster_num)
        case _ => clusterLSH(new_conv_in, out_dim.head :: out_dim(1) :: ic :: Nil, dim_cluster_num)
      }

      val newK = centroidAndLabel._1.length
      val centroid_out = matrixMult(centroid, new_kernel)

      for (clusterID <- 0 until ){

      }

    }

    conv_out = np.zeros([new_ih, new_kw])
    conv_out_temp = np.zeros([new_ih, new_kw])
    centroid_size = 0

  }
*/

  /*
  layer_input => name of the input path
  layer_name => conv1
  option => cluster
  method => channel_LSH or channel_LSH_norm

   */
/*
  def read_input(fname: String)= {

    val filename = fname

    println("Absolute Path: " + Paths.get(".").toAbsolutePath)

    val lines = Source.fromFile(filename).getLines.toList
    val headerlines = lines.head.last.toInt
    val batch_size = lines(headerlines-1).split(" ").last

    //input_shape = [batch_size, weight, height, channel]
    val input_shape = batch_size.toInt :: lines(headerlines-1)(1).toInt :: lines(headerlines-1)(2).toInt :: lines(headerlines-1)(3).toInt :: Nil
    val input_length = input_shape.product / input_shape.head
    val conv_input = lines.drop(headerlines).map(_.slice(0,input_length))

    (conv_input, input_shape)
  }*/

/*
  def conv_layer(layer_name: String, kernel_param: Seq[Int], layer_input: String, option: String, method: String, dim_cluster_num: Int, ic: Int) = {

    println("layer name: " + layer_name)
    println("option: " + option)
    println("clustering method: " + method)
    println("kernel parameters: " + kernel_param)
    println("layer input path: " + layer_input)
    println("dim cluster num: " + dim_cluster_num)
    println("ic: " + ic)

    //files that store the model
    val param_dir = "../cifar10/param/"
    val bias_name = param_dir + "CifarNet_"+layer_name+"_biases_40000.csv"
    val weight_name = param_dir + "CifarNet_"+layer_name+"_weights_40000.csv"

    // read inputs
    read_input(layer_input)


  }*/
}
