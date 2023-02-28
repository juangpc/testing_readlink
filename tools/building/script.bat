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

ScriptPath="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
BasePath="$(cd "$(ScriptPath)../.." >/dev/null 2>&1; pwd -P)"


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




