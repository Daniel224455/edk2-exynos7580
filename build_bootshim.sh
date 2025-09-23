cd BootShim
make UEFI_BASE=0x50000000 UEFI_SIZE=0x00B00000
rm BootShim.elf
cd ..