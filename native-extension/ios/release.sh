#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap

cd "$(dirname $0)"

rm -rf release
mkdir release

# I would like to make it include $FLEX_SDK/include so that FlashRuntimeExtension.h is properly included without having to open XCode
# xcodebuild -target TapForTapAir -scheme TapForTapAir OBJROOT=build SYMROOT=interim-release -configuration Release -sdk "$IOS_TARGET"

xcodebuild -project 'TapForTapAir.xcodeproj' -configuration 'Release' -sdk 'iphoneos7.0' clean build ARCHS='armv7 armv7s' IPHONEOS_DEPLOYMENT_TARGET='5.0' TARGET_BUILD_DIR='./build/build-arm' BUILT_PRODUCTS_DIR='./build/build-arm'
xcodebuild -project 'TapForTapAir.xcodeproj' -configuration 'Release' -sdk 'iphoneos7.0' clean build ARCHS='arm64' IPHONEOS_DEPLOYMENT_TARGET='7.0' TARGET_BUILD_DIR='./build/build-arm64' BUILT_PRODUCTS_DIR='./build/build-arm64'
xcodebuild -project 'TapForTapAir.xcodeproj' -configuration 'Release' -sdk 'iphonesimulator7.0' clean build ARCHS='i386' IPHONEOS_DEPLOYMENT_TARGET='5.0' TARGET_BUILD_DIR='./build/build-i386' BUILT_PRODUCTS_DIR='./build/build-i386'
xcodebuild -project 'TapForTapAir.xcodeproj' -configuration 'Release' -sdk 'iphonesimulator7.0' clean build ARCHS='x86_64' VALID_ARCHS='x86_64' IPHONEOS_DEPLOYMENT_TARGET='7.0' TARGET_BUILD_DIR='./build/build-x86_64' BUILT_PRODUCTS_DIR='./build-x86_64'
lipo -create './build/build-arm/libTapForTapAir.a' './build/build-arm64/libTapForTapAir.a' './build/build-i386/libTapForTapAir.a' './build/build-x86_64/libTapForTapAir.a' -output './build/libTapForTapAir.a'

cp build/libTapForTapAir.a release/
xcrun -sdk iphoneos lipo -info release/libTapForTapAir.a
