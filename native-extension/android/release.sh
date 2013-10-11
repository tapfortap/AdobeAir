#!/bin/sh

# Licensed under the MIT license
# https://tapfortap.com/LICENSE
# Copyright (c) 2013 Tap for Tap

cd "$(dirname $0)"

rm -rf release
mkdir release

ant release
