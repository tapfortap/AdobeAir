#!/bin/sh

# Licensed under the MIT license
# https://tapfortap.com/LICENSE.txt
# Copyright (c) 2013 Tap for Tap

VERSION="1.2.2"
set -x

cd "$(dirname $0)"

ANDROID_FILE=native-extension/android/src/com/tapfortap/ane/TapForTapExtension.java
IOS_FILE=native-extension/ios/TapForTapAir/TapForTapAir.m

# Update the Plugin Version numbers in the native files
sed -i '' "s/.*TapForTap.PLUGIN_VERSION.*/        TapForTap.PLUGIN_VERSION = \"$VERSION\";/" $ANDROID_FILE
sed -i '' "s/.*TFTTapForTap performSelector: @selector(setPluginVersion:).*/    [TFTTapForTap performSelector: @selector(setPluginVersion:) withObject: @\"$VERSION\"];/" $IOS_FILE

rm -rf release
mkdir release

if [ -f update_native_libraries ];
then
	./update_native_libraries.sh
fi

native-extension/release.sh
cd release
cp ../native-extension/release/tapfortap.ane .
