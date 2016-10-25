#!/bin/sh
# Copyright 2016 The Rust Project Developers. See the COPYRIGHT
# file at the top-level directory of this distribution and at
# http://rust-lang.org/COPYRIGHT.
#
# Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
# http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
# <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
# option. This file may not be copied, modified, or distributed
# except according to those terms.

set -ex

TARGET=$1

$SRC/configure \
    --prefix=/tmp/obj/install \
    --target=$TARGET \
    --enable-nightly

make cargo-$TARGET -j10
make dist-$TARGET -j10

if [ ! -z "$MAKE_TARGETS" ]; then
  for target in "$MAKE_TARGETS"; do
    make $target
  done
fi
