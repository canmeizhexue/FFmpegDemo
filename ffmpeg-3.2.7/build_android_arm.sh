#！/bin/bash
NDK=$ANDROID_NDK_ROOT
#NDK=/home/zyp/Android/Ndk/android-ndk-r14b
echo "NDK ROOT is $NDK"
SYSROOT=$NDK/platforms/android-14/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
CPU=arm
# to save product
PREFIX=./android/$CPU
ADDI_CFLAGS="-marm"
function build_one {
  ./configure \
  --prefix=$PREFIX \
  --enable-shared \
  --disable-static \
  --disable-doc \
  --disable-ffserver \
  --enable-cross-compile \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --target-os=linux \
  --arch=arm \
  --sysroot=$SYSROOT \
  --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
  --extra-ldflags="$ADDI_LDFLAGS" \
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make 
  make install
}
build_one
