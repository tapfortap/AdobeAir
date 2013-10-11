#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap

set -x

SRC_PATH=src
DST_DIR=release
SWC_NAME=tapfortap-library.swc

CLASSES="com.tapfortap.ane.TapForTap"

cd "$(dirname $0)"

rm -rf "$DST_DIR"
mkdir "$DST_DIR"

"$FLEX_SDK/bin/compc" -swf-version 13 -source-path "$SRC_PATH" -include-classes $CLASSES -external-library-path "$FLEX_SDK/frameworks/libs/air/airglobal.swc" -output "$DST_DIR/$SWC_NAME"
cp src/extension.xml release
