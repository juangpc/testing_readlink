#!/bin/bash

#####  default parameters

argc=$#
argv=("$@")

function cleanPath()
{
    local  cleanPathStr="$(
        cd "$1" >/dev/null 2>&1 
        pwd -P
    )"
    echo "$cleanPathStr"
}

absolute_path(){
    echo "$(cd "$1" >/dev/null 2>&1 ; pwd -P)"
}


BuildFolder=""
SourceFolder=""

ScriptPath="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
BasePath="$(cd "$ScriptPath../.." >/dev/null 2>&1; pwd -P)"
ScriptPath2="$(cleanPath "$(dirname "$0")")"
BasePath2="$(cleanPath "$ScriptPath2../..")"
ScriptPath3=$(absolute_path "$(dirname "$0")")
BasePath3=$(absolute_path "${ScriptPath3}../..")


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
  echo " ScriptPath2   = $ScriptPath2"
  echo " BasePath2     = $BasePath2"
  echo " ScriptPath3   = $ScriptPath3"
  echo " BasePath3     = $BasePath3"
  echo " BuildFolder  = $BuildFolder"
  echo " SourceFolder = $SourceFolder"
  echo " "
  echo ========================================================================
  echo ========================================================================
  echo " "
}

function cleanPath()
{
    local  cleanPathStr="$(cd "$1" >/dev/null 2>&1; pwd -P)"
    echo "$cleanPathStr"
}

BuildFolder=${BasePath}/build/${BuildType}
SourceFolder=${BasePath}/src

doPrintConfiguration





