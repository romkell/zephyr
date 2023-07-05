# Zephyr specification build configuration file.
# References:
# - https://www.sphinx-doc.org/en/master/usage/configuration.html
# - https://sphinx-needs.readthedocs.io/en/latest/configuration.html

import sys
import os
from pathlib import Path
import re

from sphinx.cmd.build import get_parser


ZEPHYR_BASE = Path(__file__).resolve().parents[1]

project = "Zephyr Specs"
copyright = "2015-2023 Zephyr Project members and individual contributors"
author = "The Zephyr Project Contributors"

extensions = [
    "sphinx_needs",
#    "breathe",
    "sphinx.ext.todo",
    "sphinx.ext.extlinks",
    "sphinx.ext.autodoc",
    "sphinx.ext.graphviz"
]

html_title = "Zephyr Project Documentation"
html_logo = str(ZEPHYR_BASE / "doc" / "_static" / "images" / "logo.svg")
html_favicon = str(ZEPHYR_BASE / "doc" / "_static" / "images" / "favicon.png")
html_static_path = [str(ZEPHYR_BASE / "doc" / "_static")]
html_last_updated_fmt = "%b %d, %Y"
html_domain_indices = False
html_split_index = True
html_show_sourcelink = False
html_show_sphinx = False
html_search_scorer = str(ZEPHYR_BASE / "doc" / "_static" / "js" / "scorer.js")


# Set this option to False, if no needs should be documented inside the generated documentation.
needs_include_needs = True

# This option defines the length of an automated generated ID (the length of the prefix does not count).
needs_id_length = 8

# The option allows the setup of own need types like bugs, user_stories and more.
needs_types = [dict(directive="sreq", title="Software Requirement", prefix="SRS_", color="#BFD8D2", style="node"),
               dict(directive="areq", title="Arch&Iface Requirement", prefix="SAIS_", color="#FEDCD2", style="node"),
               dict(directive="creq", title="Component Requirement", prefix="SCDS_", color="#DF744A", style="node"),
               dict(directive="stest", title="Software Test Case", prefix="STS_", color="#DCB239", style="node"),
               dict(directive="atest", title="Integration Test Case", prefix="SITS_", color="#DCB239", style="node"),
               dict(directive="ctest", title="Component Test Case", prefix="SCTS_", color="#DCB239", style="node"),
               # Kept for backwards compatibility
               dict(directive="need", title="Need", prefix="N_", color="#9856a5", style="node")
           ]

# The option allows the addition of extra options (fields) that you can specify on needs.
needs_extra_options = ['restriction']

# Global options are set on global level for all needs, so that all needs get the same value for the configured option.
needs_global_options = {}

# Allows the definition of additional link types.
needs_extra_links = [
   {
      "option": "verifies",
      "outgoing": "verifies [out]",
      "incoming": "is verified by [in]",
   },
   {
      "option": "is_verified_by",
      "outgoing": "is verified by [out]",
      "incoming": "verifies [in]",
   },
   {
      "option": "refines",
      "outgoing": "refines [out]",
      "incoming": "is refined by [in]",
   },
   {
      "option": "is_refined_by",
      "outgoing": "is refined by [out]",
      "incoming": "refines [in]",
   },
   {
      "option": "implements",
      "outgoing": "implements [out]",
      "incoming": "is implemented by [in]",
   },
   {
      "option": "is_implemented_by",
      "outgoing": "is implemented by [out]",
      "incoming": "implements [in]",
   },
   {
      "option": "relates_to",
      "outgoing": "relates to [out]",
      "incoming": "is related to by [in]",
   },
   {
      "option": "is_related_to_by",
      "outgoing": "is related to by [out]",
      "incoming": "relates to [in]",
   },
]

# Used to de/activate the output of link type names beside the connection in the needflow directive
# Default value: False
needs_flow_show_links = True
