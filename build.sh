#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p EXYNOS7885Pkg/Devices/a5xlte.dsc
cat ./BootShim/BootShim.bin workspace/Build/EXYNOS7885Pkg/DEBUG_GCC5/FV/EXYNOS7885PKG_UEFI.fd > workspace/UEFI

python3 mkbootimg.py \
  --kernel workspace/UEFI \
  --ramdisk ramdisk \
  --base 0x10000000 \
  --kernel_offset 0x00008000 \
  --ramdisk_offset 0x01000000 \
  --second_offset 0x00f00000 \
  --tags_offset 0x00000100 \
  --os_version 8.1.0 \
  --pagesize 2048 \
  --os_patch_level "2018-11" \
  --header_version 0 \
  -o "boot.img" \

cat device_specific/a5xlte.dtb >>boot.img
tar -c boot.img -f boot.tar
