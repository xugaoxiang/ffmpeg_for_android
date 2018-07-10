#!/bin/sh

export ANDROID_NDK=/home/xugaoxiang/Tools/NDK/android-ndk-r15c
export SYSROOT=$ANDROID_NDK/platforms/android-21/arch-arm

# clone x264
git clone http://git.videolan.org/git/x264.git

cd x264

CPU=arm
PREFIX=$(pwd)/android-build/$CPU

./configure --prefix=$PREFIX --enable-static --enable-pic --host=arm-linux --cross-prefix="$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-" --sysroot=$SYSROOT

make clean
make
make install
