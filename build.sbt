// See LICENSE for license details.
organization := "bilkent"
name := "deep-reuse"
version := "1.0.0"

lazy val commonSettings = Seq(
  scalaVersion := "2.12.10",  // This needs to match rocket-chip's scalaVersion
  scalacOptions ++= Seq(
    "-deprecation",
    "-feature",
    "-unchecked",
    "-Xsource:2.11",
    "-language:reflectiveCalls"
  )
)

// A RootProject (not well-documented) tells sbt to treat the target directory
// as its own root project, reading its build settings. If we instead used the
// normal `project in file()` declaration, sbt would ignore all of rocket-chip's
// build settings, and therefore not understand that it has its own dependencies
// on chisel, etc.
lazy val rocketChip = RootProject(file("rocket-chip"))


lazy val sifiveBlocks = (project in file("sifive-blocks")).
  dependsOn(rocketChip).
  settings(commonSettings: _*)


lazy val deepReuse = (project in file("deepreuse")).
  dependsOn(rocketChip, sifiveBlocks).
  settings(commonSettings: _*)


lazy val fpgaShells = (project in file("fpga-shells")).
  dependsOn(rocketChip, deepReuse, sifiveBlocks).
  settings(commonSettings: _*)
 

lazy val topPlatforms = (project in file(".")).
  dependsOn(rocketChip, sifiveBlocks, deepReuse, fpgaShells).
  settings(commonSettings: _*)


