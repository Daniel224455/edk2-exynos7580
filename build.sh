#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
rm boot.img boot.tar
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -j$(nproc) -s -n 0 -a AARCH64 -t GCC5 -p EXYNOS7580Pkg/Devices/a5xelte.dsc||exit 1
cat BootShim/BootShim.bin workspace/Build/EXYNOS7580Pkg/DEBUG_GCC5/FV/EXYNOS7580PKG_UEFI.fd > workspace/payload.bin||exit 1

python3 ./device_specific/mkbootimg.py \
	--kernel ./workspace/payload.bin \
	--ramdisk ./device_specific/dummyramdisk \
	--dtb "./device_specific/a5xe/a5xelte.dt" \
	--base 0x10000000 \
	--kernel_offset 0x00008000 \
	--ramdisk_offset 0x01000000 \
	--tags_offset 0x00000100 \
	--pagesize 2048 \
	--os_version 7.0.0 \
	--os_patch_level "$(date '+%Y-%m')" \
	--board "SRPOJ07A003KU" \
	-o boot.img 

tar -c boot.img -f boot.tar
