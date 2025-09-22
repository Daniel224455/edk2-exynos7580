#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -j$(nproc) -s -n 0 -a AARCH64 -t GCC5 -p EXYNOS7580Pkg/Devices/a5xelte.dsc
cat BootShim/BootShim.bin workspace/Build/EXYNOS7580Pkg/DEBUG_GCC5/FV/EXYNOS7580PKG_UEFI.fd > workspace/boot.img-zImage
cd device_specific/aik
./unpackimg_x64.sh boot.img
rm split_img/boot.img-zImage
cp ../../workspace/boot.img-zImage split_img/
./repackimg_x64.sh boot.img
mv image-new.img ../../workspace/boot.img
./cleanup.sh
cd ../../workspace/
tar -c boot.img -f boot.tar
cd ..
