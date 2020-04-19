package system

import Chisel._
import chisel3.experimental.RawModule
import chisel3.internal.firrtl.Circuit
// TODO: better job of Makefrag generation for non-RocketChip testing platforms
import java.io.{File, FileWriter}
import firrtl.annotations.JsonProtocol


/** Representation of the information this Generator needs to collect from external sources. */
case class ParsedInputNames(
    targetDir: String,
    topModuleName: String)
/** Common utilities we supply to all Generators. In particular, supplies the
  * canonical ways of building various JVM elaboration-time structures.
  */
trait HasGeneratorUtilities {
  def elaborate(topModuleName: String): Circuit = {

    val top = () => 
      Class.forName(topModuleName).getConstructor().newInstance() match {
        case m: RawModule => m
      }

    Driver.elaborate(top)
  }
}


/** Standardized command line interface for Scala entry point */
trait GeneratorApp extends App with HasGeneratorUtilities {
  lazy val names: ParsedInputNames = {
    require(args.size == 2, "Usage: sbt> " + 
      "run TargetDir TopModuleName")
    ParsedInputNames(
      targetDir = args(0),
      topModuleName = args(1))
  }

  // Canonical ways of building various JVM elaboration-time structures
  lazy val td: String = names.targetDir
  lazy val circuit: Circuit = elaborate(names.topModuleName)

  val longName: String // Exhaustive name used to interface with external build tool targets

  /** Output FIRRTL, which an external compiler can turn into Verilog. */
  def generateFirrtl {
    Driver.dumpFirrtl(circuit, Some(new File(td, s"$longName.fir"))) // FIRRTL
  }

  def generateAnno {
    val annotationFile = new File(td, s"$longName.anno.json")
    val af = new FileWriter(annotationFile)
    af.write(JsonProtocol.serialize(circuit.annotations.map(_.toFirrtl)))
    af.close()
  }
}