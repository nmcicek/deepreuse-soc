package lsh

class Dot[T](v1: Seq[T])(implicit n: Numeric[T]) {
  import n._ // import * operator
  def dot(v2: Seq[T]) = {
    require(v1.size == v2.size)
    (v1 zip v2).map{ Function.tupled(_ * _)}.sum
  }
}
