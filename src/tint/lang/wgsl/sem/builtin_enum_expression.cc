// Copyright 2023 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/tint/lang/wgsl/sem/builtin_enum_expression.h"

#include "src/tint/lang/core/access.h"
#include "src/tint/lang/core/address_space.h"
#include "src/tint/lang/core/builtin_value.h"
#include "src/tint/lang/core/interpolation_sampling.h"
#include "src/tint/lang/core/interpolation_type.h"
#include "src/tint/lang/core/texel_format.h"
#include "src/tint/lang/wgsl/builtin_fn.h"

TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpressionBase);

// Specializations
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::Access>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::AddressSpace>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::BuiltinValue>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::InterpolationSampling>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::InterpolationType>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::core::TexelFormat>);
TINT_INSTANTIATE_TYPEINFO(tint::sem::BuiltinEnumExpression<tint::wgsl::BuiltinFn>);

namespace tint::sem {

BuiltinEnumExpressionBase::BuiltinEnumExpressionBase(const ast::Expression* declaration,
                                                     const Statement* statement)
    : Base(declaration, statement) {}

BuiltinEnumExpressionBase::~BuiltinEnumExpressionBase() = default;

}  // namespace tint::sem
