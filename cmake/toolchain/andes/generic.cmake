# SPDX-License-Identifier: Apache-2.0

zephyr_get(NDS_TOOLCHAIN_PATH)
assert(    NDS_TOOLCHAIN_PATH "NDS_TOOLCHAIN_PATH is not set")

if(NOT EXISTS ${NDS_TOOLCHAIN_PATH})
  message(FATAL_ERROR "Nothing found at NDS_TOOLCHAIN_PATH: '${NDS_TOOLCHAIN_PATH}'")
endif()

if(("${BOARD}" STREQUAL "gpsi_cpu1") OR ("${BOARD}" STREQUAL "gpsi_cpu1_sim"))
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5)
elseif(("${BOARD}" STREQUAL "gpsi_cpu2") OR ("${BOARD}" STREQUAL "gpsi_cpu2_sim"))
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5e)
elseif(("${BOARD}" STREQUAL "gpsi_target") OR ("${BOARD}" STREQUAL "gpsi_target_sim"))
set(NDS_TOOLCHAIN_PATH_FULL ${NDS_TOOLCHAIN_PATH}/nds32le-elf-mculib-v5)
endif()

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
