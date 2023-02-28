#!/bin/bash

#####  default parameters

argc=$#
argv=("$@")

VerboseMode="false"
BuildType="Release"
WithCodeCoverage="false"
BuildFolder=""
SourceFolder=""
NumProcesses="1"

ScriptPath="$(readlink -f $(dirname "$0"))"
BasePath="$(readlink -f $ScriptPath/../..)"

if [ "$(uname)" == "Darwin" ]; then
    NumProcesses=$(sysctl -n hw.physicalcpu)
else 
    NumProcesses=$(expr $(nproc --all) / 2)
fi

doPrintConfiguration() {
  echo " "
  echo ========================================================================
  echo ======================== MNE-CPP BUILD CONFIG ==========================
  echo " "
  echo " ScriptPath   = $ScriptPath"
  echo " BasePath     = $BasePath"
  echo " BuildFolder  = $BuildFolder"
  echo " SourceFolder = $SourceFolder"
  echo " "
  echo " VerboseMode = $VerboseMode"
  echo " Buildtype = $BuildType"
  echo " WithCodeCoverage = $WithCodeCoverage"
  echo " NumProcesses = $NumProcesses"
  echo " "
  echo ========================================================================
  echo ========================================================================
  echo " "
}

BuildFolder=${BasePath}/build/${BuildType}
SourceFolder=${BasePath}/src

doPrintConfiguration

exit 1




