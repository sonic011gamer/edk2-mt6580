#!/bin/bash
# based on the instructions from edk2-platform
set -e
. ./scripts/build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabi- build -j$(nproc) -s -n 0 -a ARM -t GCC5 -p APPLEPkg/Devices/pmt3151.dsc
cat BootShim/BootShim.bin workspace/Build/APPLEPkg/DEBUG_GCC5/FV/APPLEPKG_UEFI.fd > workspace/zImage
python scripts/fix_kernel.py workspace/zImage
cat workspace/zImage dtb/pmt3151.dtb > workspace/zImage-dtb
python scripts/check_kernel.py workspace/zImage-dtb

mkbootimg --kernel workspace/zImage-dtb --base 0x80000000 --ramdisk_offset 0x04000000 --tags_offset 0xe000000 --cmdline "bootopt=64S3,32S1,32S1" -o workspace/boot.img