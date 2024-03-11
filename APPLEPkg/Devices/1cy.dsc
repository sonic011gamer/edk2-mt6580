[Defines]
  PLATFORM_NAME                  = APPLEPkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = APPLEPkg/APPLEPkg.fdf

!include APPLEPkg/APPLEPkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (0.5GB)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x40000000
  
  gArmPlatformTokenSpaceGuid.PcdCoreCount|1
  gArmPlatformTokenSpaceGuid.PcdClusterCount|1


  #
  # ARM General Interrupt Controller
  #
  #gArmTokenSpaceGuid.PcdGicDistributorBase|0x10211000
  #gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x10212000

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x80C40000

  # Framebuffer (720x1280)
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|800
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1280
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|800
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|1280
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0xff100000


