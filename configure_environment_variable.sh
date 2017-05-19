#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
export RUST_SRC_PATH=~/.multirust/toolchains/[your-toolchain]/lib/rustlib/src/rust/src
if [ "$(uname)" == "Darwin" ]; then
    current_platform="OSX"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    current_platform="Linux"
fi

if [ "$current_platform" == "OSX" ]; then
    export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
elif [ "$current_platform" == "Linux" ]; then
    export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-linux/lib/rustlib/src/rust/src
fi
