#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/android-install.sh
source "$(dirname "$BASH_SOURCE")"/defaults-gpl.sh

# Override for FFmpeg 4.4
GIT_BRANCH="release/4.4"

# Android ARM64 specific configuration
export ANDROID_ABI="arm64-v8a"
export ANDROID_ARCH="aarch64"
export ANDROID_API_LEVEL="21"

# Set up Android toolchain
export ANDROID_NDK_ROOT="/opt/android-ndk"
export ANDROID_TOOLCHAIN_ROOT="$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64"
export ANDROID_SYSROOT="$ANDROID_TOOLCHAIN_ROOT/sysroot"

export CC="$ANDROID_TOOLCHAIN_ROOT/bin/aarch64-linux-android${ANDROID_API_LEVEL}-clang"
export CXX="$ANDROID_TOOLCHAIN_ROOT/bin/aarch64-linux-android${ANDROID_API_LEVEL}-clang++"
export AR="$ANDROID_TOOLCHAIN_ROOT/bin/llvm-ar"
export STRIP="$ANDROID_TOOLCHAIN_ROOT/bin/llvm-strip"
export RANLIB="$ANDROID_TOOLCHAIN_ROOT/bin/llvm-ranlib"

# Android-specific configure options
FF_CONFIGURE+=" --target-os=android --arch=aarch64 --cpu=armv8-a"
FF_CONFIGURE+=" --sysroot=$ANDROID_SYSROOT"
FF_CONFIGURE+=" --cross-prefix=$ANDROID_TOOLCHAIN_ROOT/bin/aarch64-linux-android-"
FF_CONFIGURE+=" --disable-programs --enable-cross-compile"