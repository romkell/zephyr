
SCDS Queue
##########

General
*******

.. creq:: Data queue implemenation
   :id: SCDS_QUEUE_1
   :status: open
   :tags: Safety-scope

   Queue implementation shall use the systems single-linked list implementation for the data queue.

   Testing formats:

   Bulleted List
   -------------

   * bulleted list 1
   * bulleted list 2

     * nested bulleted list

   * bulleted list continued

   Numbered List (Numbers)
   -----------------------

   1. numbered list using numbers
   2. numbered list using numbers

      1. numbered list using numbers nested

   3. numbered list using numbers continued


   Numbered List (Hashes)
   ----------------------

   #. numbered list using hashes
   #. numbered list using numbhashesers

      #. numbered list using hashes nested

   #. numbered list using hashes continued

   Normal text. Next paragraph is a code sample::

      It is not processed in any way, except
      that the indentation is removed.

      It can span multiple lines.

   This is a normal text paragraph again.


   Grid Table
   ----------

   +------------------------+------------+----------+----------+
   | Header row, column 1   | Header 2   | Header 3 | Header 4 |
   | (header rows optional) |            |          |          |
   +========================+============+==========+==========+
   | body row 1, column 1   | column 2   | column 3 | column 4 |
   +------------------------+------------+----------+----------+
   | body row 2             | ...        | ...      |          |
   +------------------------+------------+----------+----------+

   Simple Table
   ------------

   =====  =====  =======
   A      B      A and B
   =====  =====  =======
   False  False  False
   True   False  False
   False  True   False
   True   True   True
   =====  =====  =======

   List Table
   ----------

   .. list-table:: Frozen Delights!
      :widths: 15 10 30
      :header-rows: 1

      * - Treat
        - Quantity
        - Description
      * - Albatross
        - 2.99
        - On a stick!
      * - Crunchy Frog
        - 1.49
        - If we took the bones out, it wouldn't be
          crunchy, now would it?
      * - Gannet Ripple
        - 1.99
        - On a stick!

   Math
   ----

   .. math::

      α_t(i) = P(O_1, O_2, … O_t, q_t = S_i λ)


   Code
   -----------

   .. code:: python

      def my_function():
           "just a test"
           print 8/2


   Hyperlinks
   ----------

   This is a paragraph that contains `a link`_.

   .. _a link: https://domain.invalid/


   PlantUML
   --------
   Currently not working, since dependencies (e.g. plantuml) not installed!

   .. uml::

      @startuml
      Alice -> Bob: Hi!
      Alice <- Bob: How are you?
      @enduml


   Graphviz
   --------

   .. graphviz::

      digraph Flatland {

         a -> b -> c -> g;
         a  [shape=polygon,sides=4]
         b  [shape=polygon,sides=5]
         c  [shape=polygon,sides=6]

         g [peripheries=3,color=yellow];
         s [shape=invtriangle,peripheries=1,color=red,style=filled];
         w  [shape=triangle,peripheries=1,color=blue,style=filled];

         }


   API Reference
   *************
   Currently not working, since dependencies (e.g. breathe) not installed!

   .. doxygengroup:: timer_apis


.. creq:: Wait queue implemenation
   :id: SCDS_QUEUE_2
   :status: open
   :tags: Safety-scope

   Queue implementation shall use the systems double-linked list implementation for the wait queue.

Traceing
========

.. creq:: Traceing macro function-entry
   :id: SCDS_QUEUE_3
   :status: open
   :tags: Safety-scope

   The system function-entry traceing macro executed on function entry shall be custom definable by the user.

.. creq:: Traceing macro function-exit
   :id: SCDS_QUEUE_4
   :status: open
   :tags: Safety-scope
   :is_related_to_by: SCDS_QUEUE_3
   :relates_to: SCDS_QUEUE_5

   The system function-exit traceing macro executed on function exit shall be custom definable by the user.

.. creq:: Traceing macro function-blocking
   :id: SCDS_QUEUE_5
   :status: open
   :tags: Security-scope

   The system function-blocking traceing macro executed before function blocks shall be custom definable by the user.

.. creq:: Tracing macros defaults
   :id: SCDS_QUEUE_6
   :status: open
   :tags: Security-scope, Safety-scope

   The system function tracing macros shall default to no executable code when not set by the user.




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

.. creq:: Race Conditions
   :id: SCDS_QUEUE_7
   :status: open
   :tags: Safety-scope

   When writing to the queue from a thread or isr, the queue shall be protected against race conditions.

.. creq:: Rescheduling on write
   :id: SCDS_QUEUE_8
   :status: open
   :tags: Safety-scope

   When succesfully writing to a queue from a thread or isr, rescheduling shall be invoked
   (to allow higher priority waiting threads to be swapped in immediately)


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









