#!/bin/sh

export ANDROID_NDK=/home/xugaoxiang/Tools/NDK/android-ndk-r15c
export SYSROOT=$ANDROID_NDK/platforms/android-21/arch-arm

# clone ffmpeg 
git clone https://git.ffmpeg.org/ffmpeg.git

cd ffmpeg

CPU=arm
PREFIX=$(pwd)/android-build/$CPU

./configure --arch=arm --cpu=armv7-a --cross-prefix="$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-" --sysroot=$SYSROOT --target-os=android --prefix=$PREFIX --disable-static --enable-shared --disable-asm --disable-doc --libdir=$PREFIX/libs/armeabi-v7a --incdir=$PREFIX/includes/armeabi-v7a --pkgconfigdir=$PREFIX/pkgconfig/armeabi-v7a

make
make install
