package system

/** A Generator for platforms containing Rocket Subsystemes */
object Generator extends GeneratorApp {
  val longName = names.topModuleName
  generateFirrtl
  generateAnno
}
