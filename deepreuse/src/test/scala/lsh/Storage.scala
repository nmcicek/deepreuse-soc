package lsh

class Storage[A,B] {

  def keys(dict: Map[A, Seq[B]]) = dict.keys
  def set_val(dict: Map[A, Seq[B]], key: A, value: Seq[B]): Map[A, Seq[B]] = dict.updated(key, value)
  def append_val(dict: Map[A, Seq[B]], key: A, value: B): Map[A, Seq[B]] = dict.updated(key, get_list(dict, key) ++ Seq(value))
  def get_list(dict: Map[A, Seq[B]], key: A): Seq[B] =
    if(dict.contains(key)) dict(key)
    else Seq()
}
