# SPDX-License-Identifier: Apache-2.0

if(CONFIG_RISCV_ISA_EXT_A)
    list(APPEND TOOLCHAIN_C_FLAGS -matomic)
endif()
