#!/bin/sh

VERSION="1.0.0"

cd "$(dirname $0)"

ANDROID_FILE=native-extension/android/src/com/tapfortap/ane/functions/InitializeWithApiKeyFunction.java
IOS_FILE=native-extension/ios/TapForTapAir/TapForTapAir.m

# Update the Plugin Version numbers in the native files
sed -i '' "s/.*TapForTap.pluginVersion.*/            TapForTap.pluginVersion = \"$VERSION\";/" $ANDROID_FILE
sed -i '' "s/.*TapForTap performSelector: @selector(_setPluginVersion:).*/    [TapForTap performSelector: @selector(_setPluginVersion:) withObject: @\"$VERSION\"];/" $IOS_FILE

rm -rf release
mkdir release

if [ -f update_native_libraries ];
then
	./update_native_libraries
fi

native-extension/release.sh
cd release
cp ../native-extension/release/tapfortap.ane .
zip TapForTap-Air-"$VERSION".zip ./*
rm -rf tapfortap.ane
