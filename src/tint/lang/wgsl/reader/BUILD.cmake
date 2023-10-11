# Copyright 2023 The Tint Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

include(lang/wgsl/reader/lower/BUILD.cmake)
include(lang/wgsl/reader/parser/BUILD.cmake)
include(lang/wgsl/reader/program_to_ir/BUILD.cmake)

if(TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_reader
# Kind:      lib
# Condition: TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_reader lib
  lang/wgsl/reader/reader.cc
  lang/wgsl/reader/reader.h
)

tint_target_add_dependencies(tint_lang_wgsl_reader lib
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_program
  tint_lang_wgsl_reader_lower
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_reader lib
    tint_lang_wgsl_reader_parser
    tint_lang_wgsl_reader_program_to_ir
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_WGSL_READER)
if(TINT_BUILD_WGSL_READER)
################################################################################
# Target:    tint_lang_wgsl_reader_bench
# Kind:      bench
# Condition: TINT_BUILD_WGSL_READER
################################################################################
tint_add_target(tint_lang_wgsl_reader_bench bench
  lang/wgsl/reader/reader_bench.cc
)

tint_target_add_dependencies(tint_lang_wgsl_reader_bench bench
  tint_api_common
  tint_cmd_bench_bench
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_reader_bench bench
  "google-benchmark"
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_wgsl_reader_bench bench
    tint_lang_wgsl_reader
  )
endif(TINT_BUILD_WGSL_READER)

endif(TINT_BUILD_WGSL_READER)