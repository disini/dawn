// Copyright 2020 The Tint Authors.
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

#include <sstream>

#include "gtest/gtest.h"
#include "src/ast/call_expression.h"
#include "src/ast/identifier_expression.h"
#include "src/program.h"
#include "src/type/f32_type.h"
#include "src/type/vector_type.h"
#include "src/type_determiner.h"
#include "src/writer/msl/generator_impl.h"
#include "src/writer/msl/test_helper.h"

namespace tint {
namespace writer {
namespace msl {
namespace {

using MslGeneratorImplTest = TestHelper;

enum class ParamType {
  kF32,
  kU32,
  kBool,
};

struct IntrinsicData {
  ast::Intrinsic intrinsic;
  ParamType type;
  const char* msl_name;
};
inline std::ostream& operator<<(std::ostream& out, IntrinsicData data) {
  out << data.msl_name << "<";
  switch (data.type) {
    case ParamType::kF32:
      out << "f32";
      break;
    case ParamType::kU32:
      out << "u32";
      break;
    case ParamType::kBool:
      out << "bool";
      break;
  }
  out << ">";
  return out;
}

ast::CallExpression* GenerateCall(ast::Intrinsic intrinsic,
                                  ParamType type,
                                  ProgramBuilder* builder) {
  std::string name;
  std::ostringstream str(name);
  str << intrinsic;
  switch (intrinsic) {
    case ast::Intrinsic::kAcos:
    case ast::Intrinsic::kAsin:
    case ast::Intrinsic::kAtan:
    case ast::Intrinsic::kCeil:
    case ast::Intrinsic::kCos:
    case ast::Intrinsic::kCosh:
    case ast::Intrinsic::kDpdx:
    case ast::Intrinsic::kDpdxCoarse:
    case ast::Intrinsic::kDpdxFine:
    case ast::Intrinsic::kDpdy:
    case ast::Intrinsic::kDpdyCoarse:
    case ast::Intrinsic::kDpdyFine:
    case ast::Intrinsic::kExp:
    case ast::Intrinsic::kExp2:
    case ast::Intrinsic::kFloor:
    case ast::Intrinsic::kFract:
    case ast::Intrinsic::kFwidth:
    case ast::Intrinsic::kFwidthCoarse:
    case ast::Intrinsic::kFwidthFine:
    case ast::Intrinsic::kInverseSqrt:
    case ast::Intrinsic::kIsFinite:
    case ast::Intrinsic::kIsInf:
    case ast::Intrinsic::kIsNan:
    case ast::Intrinsic::kIsNormal:
    case ast::Intrinsic::kLdexp:
    case ast::Intrinsic::kLength:
    case ast::Intrinsic::kLog:
    case ast::Intrinsic::kLog2:
    case ast::Intrinsic::kNormalize:
    case ast::Intrinsic::kReflect:
    case ast::Intrinsic::kRound:
    case ast::Intrinsic::kSin:
    case ast::Intrinsic::kSinh:
    case ast::Intrinsic::kSqrt:
    case ast::Intrinsic::kTan:
    case ast::Intrinsic::kTanh:
    case ast::Intrinsic::kTrunc:
    case ast::Intrinsic::kSign:
      return builder->Call(str.str(), "f1");
      break;
    case ast::Intrinsic::kAtan2:
    case ast::Intrinsic::kCross:
    case ast::Intrinsic::kDot:
    case ast::Intrinsic::kDistance:
    case ast::Intrinsic::kPow:
    case ast::Intrinsic::kStep:
      return builder->Call(str.str(), "f1", "f2");
    case ast::Intrinsic::kFma:
    case ast::Intrinsic::kMix:
    case ast::Intrinsic::kFaceForward:
    case ast::Intrinsic::kSmoothStep:
      return builder->Call(str.str(), "f1", "f2", "f3");
    case ast::Intrinsic::kAll:
    case ast::Intrinsic::kAny:
      return builder->Call(str.str(), "b1");
    case ast::Intrinsic::kAbs:
      if (type == ParamType::kF32) {
        return builder->Call(str.str(), "f1");
      } else {
        return builder->Call(str.str(), "u1");
      }
    case ast::Intrinsic::kCountOneBits:
    case ast::Intrinsic::kReverseBits:
      return builder->Call(str.str(), "u1");
    case ast::Intrinsic::kMax:
    case ast::Intrinsic::kMin:
      if (type == ParamType::kF32) {
        return builder->Call(str.str(), "f1", "f2");
      } else {
        return builder->Call(str.str(), "u1", "u2");
      }
    case ast::Intrinsic::kClamp:
      if (type == ParamType::kF32) {
        return builder->Call(str.str(), "f1", "f2", "f3");
      } else {
        return builder->Call(str.str(), "u1", "u2", "u3");
      }
    case ast::Intrinsic::kSelect:
      return builder->Call(str.str(), "f1", "f2", "b1");
    case ast::Intrinsic::kDeterminant:
      return builder->Call(str.str(), "m1");
    default:
      break;
  }
  return nullptr;
}

using MslIntrinsicTest = TestParamHelper<IntrinsicData>;
TEST_P(MslIntrinsicTest, Emit) {
  auto param = GetParam();

  auto* call = GenerateCall(param.intrinsic, param.type, this);
  ASSERT_NE(nullptr, call) << "Unhandled intrinsic";

  auto* f1 = Var("f1", ast::StorageClass::kFunction, ty.vec2<float>());
  auto* f2 = Var("f2", ast::StorageClass::kFunction, ty.vec2<float>());
  auto* f3 = Var("f3", ast::StorageClass::kFunction, ty.vec2<float>());
  auto* u1 = Var("u1", ast::StorageClass::kFunction, ty.vec2<unsigned int>());
  auto* u2 = Var("u2", ast::StorageClass::kFunction, ty.vec2<unsigned int>());
  auto* u3 = Var("u3", ast::StorageClass::kFunction, ty.vec2<unsigned int>());
  auto* b1 = Var("b1", ast::StorageClass::kFunction, ty.vec2<bool>());
  auto* m1 = Var("m1", ast::StorageClass::kFunction, ty.mat2x2<float>());
  td.RegisterVariableForTesting(f1);
  td.RegisterVariableForTesting(f2);
  td.RegisterVariableForTesting(f3);
  td.RegisterVariableForTesting(u1);
  td.RegisterVariableForTesting(u2);
  td.RegisterVariableForTesting(u3);
  td.RegisterVariableForTesting(b1);
  td.RegisterVariableForTesting(m1);
  ASSERT_TRUE(td.DetermineResultType(call)) << td.error();
  GeneratorImpl& gen = Build();

  EXPECT_EQ(
      gen.generate_builtin_name(call->func()->As<ast::IdentifierExpression>()),
      param.msl_name);
}
INSTANTIATE_TEST_SUITE_P(
    MslGeneratorImplTest,
    MslIntrinsicTest,
    testing::Values(
        IntrinsicData{ast::Intrinsic::kAbs, ParamType::kF32, "metal::fabs"},
        IntrinsicData{ast::Intrinsic::kAbs, ParamType::kU32, "metal::abs"},
        IntrinsicData{ast::Intrinsic::kAcos, ParamType::kF32, "metal::acos"},
        IntrinsicData{ast::Intrinsic::kAll, ParamType::kBool, "metal::all"},
        IntrinsicData{ast::Intrinsic::kAny, ParamType::kBool, "metal::any"},
        IntrinsicData{ast::Intrinsic::kAsin, ParamType::kF32, "metal::asin"},
        IntrinsicData{ast::Intrinsic::kAtan, ParamType::kF32, "metal::atan"},
        IntrinsicData{ast::Intrinsic::kAtan2, ParamType::kF32, "metal::atan2"},
        IntrinsicData{ast::Intrinsic::kCeil, ParamType::kF32, "metal::ceil"},
        IntrinsicData{ast::Intrinsic::kClamp, ParamType::kF32, "metal::clamp"},
        IntrinsicData{ast::Intrinsic::kClamp, ParamType::kU32, "metal::clamp"},
        IntrinsicData{ast::Intrinsic::kCos, ParamType::kF32, "metal::cos"},
        IntrinsicData{ast::Intrinsic::kCosh, ParamType::kF32, "metal::cosh"},
        IntrinsicData{ast::Intrinsic::kCountOneBits, ParamType::kU32,
                      "metal::popcount"},
        IntrinsicData{ast::Intrinsic::kCross, ParamType::kF32, "metal::cross"},
        IntrinsicData{ast::Intrinsic::kDeterminant, ParamType::kF32,
                      "metal::determinant"},
        IntrinsicData{ast::Intrinsic::kDistance, ParamType::kF32,
                      "metal::distance"},
        IntrinsicData{ast::Intrinsic::kDot, ParamType::kF32, "metal::dot"},
        IntrinsicData{ast::Intrinsic::kDpdx, ParamType::kF32, "metal::dfdx"},
        IntrinsicData{ast::Intrinsic::kDpdxCoarse, ParamType::kF32,
                      "metal::dfdx"},
        IntrinsicData{ast::Intrinsic::kDpdxFine, ParamType::kF32,
                      "metal::dfdx"},
        IntrinsicData{ast::Intrinsic::kDpdy, ParamType::kF32, "metal::dfdy"},
        IntrinsicData{ast::Intrinsic::kDpdyCoarse, ParamType::kF32,
                      "metal::dfdy"},
        IntrinsicData{ast::Intrinsic::kDpdyFine, ParamType::kF32,
                      "metal::dfdy"},
        IntrinsicData{ast::Intrinsic::kExp, ParamType::kF32, "metal::exp"},
        IntrinsicData{ast::Intrinsic::kExp2, ParamType::kF32, "metal::exp2"},
        IntrinsicData{ast::Intrinsic::kFaceForward, ParamType::kF32,
                      "metal::faceforward"},
        IntrinsicData{ast::Intrinsic::kFloor, ParamType::kF32, "metal::floor"},
        IntrinsicData{ast::Intrinsic::kFma, ParamType::kF32, "metal::fma"},
        IntrinsicData{ast::Intrinsic::kFract, ParamType::kF32, "metal::fract"},
        IntrinsicData{ast::Intrinsic::kFwidth, ParamType::kF32,
                      "metal::fwidth"},
        IntrinsicData{ast::Intrinsic::kFwidthCoarse, ParamType::kF32,
                      "metal::fwidth"},
        IntrinsicData{ast::Intrinsic::kFwidthFine, ParamType::kF32,
                      "metal::fwidth"},
        IntrinsicData{ast::Intrinsic::kInverseSqrt, ParamType::kF32,
                      "metal::rsqrt"},
        IntrinsicData{ast::Intrinsic::kIsFinite, ParamType::kF32,
                      "metal::isfinite"},
        IntrinsicData{ast::Intrinsic::kIsInf, ParamType::kF32, "metal::isinf"},
        IntrinsicData{ast::Intrinsic::kIsNan, ParamType::kF32, "metal::isnan"},
        IntrinsicData{ast::Intrinsic::kIsNormal, ParamType::kF32,
                      "metal::isnormal"},
        IntrinsicData{ast::Intrinsic::kLdexp, ParamType::kF32, "metal::ldexp"},
        IntrinsicData{ast::Intrinsic::kLength, ParamType::kF32,
                      "metal::length"},
        IntrinsicData{ast::Intrinsic::kLog, ParamType::kF32, "metal::log"},
        IntrinsicData{ast::Intrinsic::kLog2, ParamType::kF32, "metal::log2"},
        IntrinsicData{ast::Intrinsic::kMax, ParamType::kF32, "metal::fmax"},
        IntrinsicData{ast::Intrinsic::kMax, ParamType::kU32, "metal::max"},
        IntrinsicData{ast::Intrinsic::kMin, ParamType::kF32, "metal::fmin"},
        IntrinsicData{ast::Intrinsic::kMin, ParamType::kU32, "metal::min"},
        IntrinsicData{ast::Intrinsic::kNormalize, ParamType::kF32,
                      "metal::normalize"},
        IntrinsicData{ast::Intrinsic::kPow, ParamType::kF32, "metal::pow"},
        IntrinsicData{ast::Intrinsic::kReflect, ParamType::kF32,
                      "metal::reflect"},
        IntrinsicData{ast::Intrinsic::kReverseBits, ParamType::kU32,
                      "metal::reverse_bits"},
        IntrinsicData{ast::Intrinsic::kRound, ParamType::kU32, "metal::round"},
        IntrinsicData{ast::Intrinsic::kSelect, ParamType::kF32,
                      "metal::select"},
        IntrinsicData{ast::Intrinsic::kSign, ParamType::kF32, "metal::sign"},
        IntrinsicData{ast::Intrinsic::kSin, ParamType::kF32, "metal::sin"},
        IntrinsicData{ast::Intrinsic::kSinh, ParamType::kF32, "metal::sinh"},
        IntrinsicData{ast::Intrinsic::kSmoothStep, ParamType::kF32,
                      "metal::smoothstep"},
        IntrinsicData{ast::Intrinsic::kSqrt, ParamType::kF32, "metal::sqrt"},
        IntrinsicData{ast::Intrinsic::kStep, ParamType::kF32, "metal::step"},
        IntrinsicData{ast::Intrinsic::kTan, ParamType::kF32, "metal::tan"},
        IntrinsicData{ast::Intrinsic::kTanh, ParamType::kF32, "metal::tanh"},
        IntrinsicData{ast::Intrinsic::kTrunc, ParamType::kF32,
                      "metal::trunc"}));

TEST_F(MslGeneratorImplTest, Intrinsic_Call) {
  auto* call = Call("dot", "param1", "param2");

  auto* v1 = Var("param1", ast::StorageClass::kFunction, ty.vec2<f32>());
  auto* v2 = Var("param2", ast::StorageClass::kFunction, ty.vec2<f32>());

  td.RegisterVariableForTesting(v1);
  td.RegisterVariableForTesting(v2);

  ASSERT_TRUE(td.DetermineResultType(call)) << td.error();

  GeneratorImpl& gen = Build();

  gen.increment_indent();
  ASSERT_TRUE(gen.EmitExpression(call)) << gen.error();
  EXPECT_EQ(gen.result(), "  metal::dot(param1, param2)");
}

}  // namespace
}  // namespace msl
}  // namespace writer
}  // namespace tint
