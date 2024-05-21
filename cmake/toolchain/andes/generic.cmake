# SPDX-License-Identifier: Apache-2.0

zephyr_get(NDS_TOOLCHAIN_PATH)
assert(    NDS_TOOLCHAIN_PATH "NDS_TOOLCHAIN_PATH is not set")

if(NOT EXISTS ${NDS_TOOLCHAIN_PATH})
  message(FATAL_ERROR "Nothing found at NDS_TOOLCHAIN_PATH: '${NDS_TOOLCHAIN_PATH}'")
endif()

if("${BOARD}" MATCHES "^gpsi_cpu1")
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5)
elseif("${BOARD}" MATCHES "^gpsi_cpu2")
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5e)
elseif("${BOARD}" MATCHES "^gpsi_target")
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5)
endif()
assert(NDS_TOOLCHAIN_PATH_FULL "board not supported: ${BOARD}")

set(TOOLCHAIN_HOME ${NDS_TOOLCHAIN_PATH_FULL})

set(COMPILER gcc)
set(LINKER ld)
set(BINTOOLS gnu)

set(CROSS_COMPILE_TARGET riscv32-elf)
set(SYSROOT_TARGET       riscv32-elf)

set(CROSS_COMPILE ${TOOLCHAIN_HOME}/bin/${CROSS_COMPILE_TARGET}-)
set(SYSROOT_DIR   ${TOOLCHAIN_HOME}/${SYSROOT_TARGET})
set(TOOLCHAIN_HAS_NEWLIB ON CACHE BOOL "True if toolchain supports newlib")

message(STATUS "Found toolchain: andes (${NDS_TOOLCHAIN_PATH})")
