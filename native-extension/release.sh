#!/bin/sh

# Licensed under the MIT license
# https://tapfortap.com/LICENSE.txt
# Copyright (c) 2013 Tap for Tap 

cd "$(dirname $0)"

rm -rf release
mkdir release

# I would like to make it include $FLEX_SDK/include so that FlashRuntimeExtension.h is properly included without having yo open XCode
ane/release.sh
cp ane/release/* release/


