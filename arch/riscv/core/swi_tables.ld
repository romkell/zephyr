/*
 * Copyright (c) 2025 Baumer (www.baumer.com)
 *
 * SPDX-License-Identifier: Apache-2.0
 */
#if LINKER_ZEPHYR_FINAL && defined(CONFIG_ISR_TABLES_LOCAL_DECLARATION)
INCLUDE isr_tables_swi.ld
#endif
