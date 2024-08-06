// Copyright 2024 The Dawn & Tint Authors
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
//   src/tint/lang/hlsl/builtin_fn.h.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#ifndef SRC_TINT_LANG_HLSL_BUILTIN_FN_H_
#define SRC_TINT_LANG_HLSL_BUILTIN_FN_H_

#include <cstdint>
#include <string>

#include "src/tint/utils/traits/traits.h"

// \cond DO_NOT_DOCUMENT
namespace tint::hlsl {

/// Enumerator of all builtin functions
enum class BuiltinFn : uint8_t {
    kAsint,
    kAsuint,
    kAsfloat,
    kDot4AddI8Packed,
    kDot4AddU8Packed,
    kF32Tof16,
    kF16Tof32,
    kInterlockedCompareExchange,
    kInterlockedExchange,
    kInterlockedAdd,
    kInterlockedMax,
    kInterlockedMin,
    kInterlockedAnd,
    kInterlockedOr,
    kInterlockedXor,
    kMul,
    kPackU8,
    kPackS8,
    kPackClampS8,
    kSign,
    kTextureStore,
    kUnpackS8S32,
    kUnpackU8U32,
    kLoad,
    kLoad2,
    kLoad3,
    kLoad4,
    kLoadF16,
    kLoad2F16,
    kLoad3F16,
    kLoad4F16,
    kStore,
    kStore2,
    kStore3,
    kStore4,
    kStoreF16,
    kStore2F16,
    kStore3F16,
    kStore4F16,
    kGatherCmp,
    kGather,
    kGatherAlpha,
    kGatherBlue,
    kGatherGreen,
    kGatherRed,
    kGetDimensions,
    kSample,
    kSampleBias,
    kSampleGrad,
    kSampleLevel,
    kNone,
};

/// @returns the name of the builtin function type.
const char* str(BuiltinFn i);

/// Emits the name of the builtin function type.
template <typename STREAM, typename = traits::EnableIfIsOStream<STREAM>>
auto& operator<<(STREAM& o, BuiltinFn i) {
    return o << str(i);
}

}  // namespace tint::hlsl
// \endcond

#endif  // SRC_TINT_LANG_HLSL_BUILTIN_FN_H_
