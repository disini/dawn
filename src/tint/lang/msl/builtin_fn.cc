// Copyright 2023 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/msl/builtin_fn.cc.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#include "src/tint/lang/msl/builtin_fn.h"

namespace tint::msl {

const char* str(BuiltinFn i) {
    switch (i) {
        case BuiltinFn::kNone:
            return "<none>";
        case BuiltinFn::kAtomicCompareExchangeWeakExplicit:
            return "atomic_compare_exchange_weak_explicit";
        case BuiltinFn::kAtomicExchangeExplicit:
            return "atomic_exchange_explicit";
        case BuiltinFn::kAtomicFetchAddExplicit:
            return "atomic_fetch_add_explicit";
        case BuiltinFn::kAtomicFetchAndExplicit:
            return "atomic_fetch_and_explicit";
        case BuiltinFn::kAtomicFetchMaxExplicit:
            return "atomic_fetch_max_explicit";
        case BuiltinFn::kAtomicFetchMinExplicit:
            return "atomic_fetch_min_explicit";
        case BuiltinFn::kAtomicFetchOrExplicit:
            return "atomic_fetch_or_explicit";
        case BuiltinFn::kAtomicFetchSubExplicit:
            return "atomic_fetch_sub_explicit";
        case BuiltinFn::kAtomicFetchXorExplicit:
            return "atomic_fetch_xor_explicit";
        case BuiltinFn::kAtomicLoadExplicit:
            return "atomic_load_explicit";
        case BuiltinFn::kAtomicStoreExplicit:
            return "atomic_store_explicit";
        case BuiltinFn::kFence:
            return "fence";
        case BuiltinFn::kGather:
            return "gather";
        case BuiltinFn::kGatherCompare:
            return "gather_compare";
        case BuiltinFn::kGetWidth:
            return "get_width";
        case BuiltinFn::kGetHeight:
            return "get_height";
        case BuiltinFn::kGetDepth:
            return "get_depth";
        case BuiltinFn::kGetArraySize:
            return "get_array_size";
        case BuiltinFn::kGetNumMipLevels:
            return "get_num_mip_levels";
        case BuiltinFn::kGetNumSamples:
            return "get_num_samples";
        case BuiltinFn::kRead:
            return "read";
        case BuiltinFn::kSample:
            return "sample";
        case BuiltinFn::kSampleCompare:
            return "sample_compare";
        case BuiltinFn::kWrite:
            return "write";
        case BuiltinFn::kDistance:
            return "distance";
        case BuiltinFn::kDot:
            return "dot";
        case BuiltinFn::kFmod:
            return "fmod";
        case BuiltinFn::kFrexp:
            return "frexp";
        case BuiltinFn::kLength:
            return "length";
        case BuiltinFn::kModf:
            return "modf";
        case BuiltinFn::kSign:
            return "sign";
        case BuiltinFn::kThreadgroupBarrier:
            return "threadgroup_barrier";
        case BuiltinFn::kSimdBallot:
            return "simd_ballot";
        case BuiltinFn::kQuadShuffleXor:
            return "quad_shuffle_xor";
    }
    return "<unknown>";
}

tint::core::ir::Instruction::Accesses GetSideEffects(BuiltinFn fn) {
    switch (fn) {
        case BuiltinFn::kAtomicCompareExchangeWeakExplicit:
        case BuiltinFn::kAtomicExchangeExplicit:
        case BuiltinFn::kAtomicFetchAddExplicit:
        case BuiltinFn::kAtomicFetchAndExplicit:
        case BuiltinFn::kAtomicFetchMaxExplicit:
        case BuiltinFn::kAtomicFetchMinExplicit:
        case BuiltinFn::kAtomicFetchOrExplicit:
        case BuiltinFn::kAtomicFetchSubExplicit:
        case BuiltinFn::kAtomicFetchXorExplicit:
        case BuiltinFn::kAtomicStoreExplicit:
        case BuiltinFn::kFence:
        case BuiltinFn::kThreadgroupBarrier:
        case BuiltinFn::kSimdBallot:
        case BuiltinFn::kQuadShuffleXor:
            return core::ir::Instruction::Accesses{core::ir::Instruction::Access::kLoad,
                                                   core::ir::Instruction::Access::kStore};

        case BuiltinFn::kAtomicLoadExplicit:
        case BuiltinFn::kGather:
        case BuiltinFn::kGatherCompare:
        case BuiltinFn::kRead:
        case BuiltinFn::kSample:
        case BuiltinFn::kSampleCompare:
            return core::ir::Instruction::Accesses{core::ir::Instruction::Access::kLoad};

        case BuiltinFn::kWrite:
            return core::ir::Instruction::Accesses{core::ir::Instruction::Access::kStore};

        case BuiltinFn::kDistance:
        case BuiltinFn::kDot:
        case BuiltinFn::kFmod:
        case BuiltinFn::kFrexp:
        case BuiltinFn::kGetWidth:
        case BuiltinFn::kGetHeight:
        case BuiltinFn::kGetDepth:
        case BuiltinFn::kGetArraySize:
        case BuiltinFn::kGetNumMipLevels:
        case BuiltinFn::kGetNumSamples:
        case BuiltinFn::kLength:
        case BuiltinFn::kModf:
        case BuiltinFn::kSign:
        case BuiltinFn::kNone:
            break;
    }
    return core::ir::Instruction::Accesses{};
}

}  // namespace tint::msl
