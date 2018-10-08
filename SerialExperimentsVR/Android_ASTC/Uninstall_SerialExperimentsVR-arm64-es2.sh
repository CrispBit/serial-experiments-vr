#!/bin/sh
cd "`dirname "$0"`"
ADB=
if [ "$ANDROID_HOME" != "" ]; then ADB=$ANDROID_HOME/platform-tools/adb; else ADB=/home/cilan/NVPACK/android-sdk-linux//platform-tools/adb; fi
DEVICE=
if [ "$1" != "" ]; then DEVICE="-s $1"; fi
echo
echo Uninstalling existing application. Failures here can almost always be ignored.
$ADB $DEVICE uninstall com.crispbit.serialexperimentsvr
echo
echo Removing old data. Failures here are usually fine - indicating the files were not on the device.
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/UE4Game/SerialExperimentsVR'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/UE4Game/UE4CommandLine.txt'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/obb/com.crispbit.serialexperimentsvr'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/Android/obb/com.crispbit.serialexperimentsvr'
echo
echo Uninstall completed
exit 0
