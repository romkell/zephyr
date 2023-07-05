SCTS Queue
##########

General
*******

.. ctest:: Data queue implemenation
   :id: SCTS_QUEUE_1
   :status: open
   :verifies: SCTS_QUEUE_2
   :tags: Safety-scope

   Review the source code that the systems single-linked list implementation for the data queue was used.

.. ctest:: Wait queue implemenation
   :id: SCTS_QUEUE_2
   :status: open
   :verifies: SCDS_QUEUE_2
   :tags: Safety-scope

   Review the source code that the systems double-linked list implementation for the wait queue was used.

Traceing
========

.. ctest:: Traceing macro function-entry
   :id: SCTS_QUEUE_3
   :status: open
   :verifies: SCDS_QUEUE_3
   :tags: Safety-scope

   1. Define SYS_PORT_TRACING_OBJ_FUNC_ENTER as a FFF trace_func_enter() getting all macro parameters passed.
   2. Call all Queue API functions verifiying for each that trace_func_enter() was called before trace_func_exit().

.. ctest:: Traceing macro function-exit
   :id: SCTS_QUEUE_4
   :status: open
   :verifies: SCDS_QUEUE_4
   :is_related_to_by: SCTS_QUEUE_3
   :relates_to: SCTS_QUEUE_5
   :tags: Safety-scope

   1. Define SYS_PORT_TRACING_OBJ_FUNC_EXIT as a FFF trace_func_exit() getting all macro parameters passed.
   2. Call all Queue API functions verifiying for each that trace_func_exit() was called after trace_func_enter().

.. ctest:: Traceing macro function-blocking
   :id: SCTS_QUEUE_5
   :status: open
   :verifies: SCDS_QUEUE_5
   :tags: Safety-scope

   1. Define SYS_PORT_TRACING_OBJ_FUNC_BLOCKING as a FFF trace_func_block() getting all macro parameters passed.
   2. Call all Queue API functions verifiying for each that trace_func_block() was called beetween trace_func_enter() and trace_func_exit().
   3. Additionally for each verify that trace_func_block() was called at the intended source code line.

.. ctest:: Tracing macros defaults
   :id: SCTS_QUEUE_6
   :status: open
   :verifies: SCDS_QUEUE_6
   :tags: Safety-scope

   Call all queue API functions .




Initialization
**************

__syscall void k_queue_init(struct k_queue \*queue)
===================================================


Control
*******

__syscall int k_queue_is_empty(struct k_queue \*queue)
======================================================

__syscall void k_queue_cancel_wait(struct k_queue \*queue)
==========================================================



Writing
*******

static int32_t queue_insert(struct k_queue \*queue, void \*prev, void \*data, bool alloc, bool is_append)
=========================================================================================================

.. ctest:: Race Conditions
   :id: SCTS_QUEUE_7
   :status: open
   :verifies: SCDS_QUEUE_7
   :tags: Safety-scope

   Do a very sophisticated test to verify which shows that race conditions do not occur.

.. ctest:: Rescheduling on write to high priorized thread
   :id: SCTS_QUEUE_8
   :status: open
   :verifies: SCDS_QUEUE_8
   :tags: Safety-scope

   Do a test which shows that the sending thread is swapped out, when sending to a queue on which a higher priorized thread is
   waiting for a message.

.. ctest:: Rescheduling on write to equal priorized thread
   :id: SCTS_QUEUE_9
   :status: open
   :verifies: SCDS_QUEUE_8
   :tags: Safety-scope

   Do a test which shows that the sending thread is continued, when sending to a queue on which a equally priorized thread is
   waiting for a message.

.. ctest:: Rescheduling on write to lower priorized thread
   :id: SCTS_QUEUE_10
   :status: open
   :verifies: SCDS_QUEUE_8, SCDS_QUEUE_DEAD_666
   :tags: Safety-scope

   Do a test which shows that the sending thread is continued, when sending to a queue on which a lower priorized thread is
   waiting for a message.

extern void k_queue_append(struct k_queue \*queue, void \*data)
===============================================================


__syscall int32_t k_queue_alloc_append(struct k_queue \*queue, void \*data)
===========================================================================

extern void k_queue_prepend(struct k_queue \*queue, void \*data)
================================================================

__syscall int32_t k_queue_alloc_prepend(struct k_queue \*queue, void \*data)
============================================================================

extern void k_queue_insert(struct k_queue \*queue, void \*prev, void \*data)
============================================================================

extern int k_queue_append_list(struct k_queue \*queue, void \*head, void \*tail)
================================================================================

extern int k_queue_merge_slist(struct k_queue \*queue, sys_slist_t \*list)
==========================================================================

bool k_queue_unique_append(struct k_queue \*queue, void \*data)
===============================================================

Reading
*******

bool k_queue_remove(struct k_queue \*queue, void \*data)
========================================================

__syscall void \*k_queue_get(struct k_queue \*queue, k_timeout_t timeout)
=========================================================================

__syscall void \*k_queue_peek_head(struct k_queue \*queue)
==========================================================

__syscall void \*k_queue_peek_tail(struct k_queue \*queue)
==========================================================









