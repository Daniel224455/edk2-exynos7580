[Defines]
  PLATFORM_NAME                  = EXYNOS7580Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = EXYNOS7580Pkg/EXYNOS7580Pkg.fdf

!include EXYNOS7580Pkg/EXYNOS7580Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (1.5GB)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x80000000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x80C00000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEXYNOS7580PkgTokenSpaceGuid.PcdUefiMemPoolBase|0x80D00000         # DXE Heap base address
  gEXYNOS7580PkgTokenSpaceGuid.PcdUefiMemPoolSize|0x03300000         # UefiMemorySize, DXE heap size
  # Framebuffer (720x1280)
  gEXYNOS7580PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x0ec000000
  gEXYNOS7580PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|720
  gEXYNOS7580PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1520
  gEXYNOS7580PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|720
  gEXYNOS7580PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|1520
