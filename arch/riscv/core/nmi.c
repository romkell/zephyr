/*
 * Copyright (c) 2013-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief NMI handler infrastructure
 *
 * Provides a boot time handler that simply hangs in a sleep loop, and a run
 * time handler that resets the CPU. Also provides a mechanism for hooking a
 * custom run time handler.
 */

#include <zephyr/kernel.h>
#include <zephyr/arch/cpu.h>
#include <zephyr/sys/printk.h>
#include <zephyr/sys/reboot.h>
#include <zephyr/toolchain.h>
#include <zephyr/linker/sections.h>

#if !defined(CONFIG_RUNTIME_NMI)
#define handler default_nmi_handler
#else
static void default_nmi_handler(void);
typedef void (*_NmiHandler_t)(void);
static _NmiHandler_t handler = default_nmi_handler;
#endif

static void default_nmi_handler(void)
{
	__asm__ volatile("wfi");
	for(;;);
}

#ifdef CONFIG_RUNTIME_NMI
/**
 *
 * @brief Install a custom runtime NMI handler
 *
 * Meant to be called by platform code if they want to install a custom NMI
 * handler that reboots. It should be installed after the console is
 * initialized if it is meant to output to the console.
 *
 */

void z_riscv_nmi_set_handler(void (*pHandler)(void))
{
	handler = pHandler;
}
#endif /* CONFIG_RUNTIME_NMI */

/**
 *
 * @brief Handler installed in the vector table
 *
 * Simply call what is installed in 'static void(*handler)(void)'.
 *
 */

void z_riscv_nmi(void)
{
	handler();
}
