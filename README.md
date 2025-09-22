Attempt to create a minimal EDK2 for Exynos 7580 devices

## Status
Boots to UEFI Shell.

### Building
Tested on Ubuntu 20.04.

First, clone EDK2.

```
cd ..
git clone https://github.com/tianocore/edk2 --recursive -b edk2-stable202502
git clone https://github.com/tianocore/edk2-platforms.git
```

You should have all three directories side by side.

Next, install dependencies:

18.04 and above:

```
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu
```

Also see [EDK2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

## Tutorials

First run ./firstrun.sh

Then, ./build.sh.

This should make a boot.tar image to be flashed in ODIN, you may need to adjust.




# Credits

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Zhuowei for making edk2-pixel3
