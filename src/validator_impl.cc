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

#include "src/validator_impl.h"

namespace tint {

ValidatorImpl::ValidatorImpl() = default;

ValidatorImpl::~ValidatorImpl() = default;

void ValidatorImpl::set_error(const Source& src, const std::string& msg) {
  error_ +=
      std::to_string(src.line) + ":" + std::to_string(src.column) + ": " + msg;
}

bool ValidatorImpl::Validate(const ast::Module* module) {
  if (!module)
    return false;
  if (!CheckImports(module))
    return false;
  if (!ValidateFunctions(module->functions()))
    return false;
  return true;
}

bool ValidatorImpl::ValidateFunctions(const ast::FunctionList& funcs) {
  for (const auto& func : funcs) {
    if (!ValidateFunction(func.get())) {
      return false;
    }
  }
  return true;
}

bool ValidatorImpl::ValidateFunction(const ast::Function* func) {
  if (!ValidateStatements(func->body()))
    return false;
  return true;
}

bool ValidatorImpl::ValidateStatements(const ast::BlockStatement* block) {
  for (const auto& stmt : *block) {
    if (!ValidateStatement(stmt.get())) {
      return false;
    }
  }
  return true;
}

bool ValidatorImpl::ValidateStatement(const ast::Statement* stmt) {
  if (stmt->IsAssign() && !ValidateAssign(stmt->AsAssign()))
    return false;

  return true;
}

bool ValidatorImpl::ValidateAssign(const ast::AssignmentStatement* a) {
  auto* lhs_result_type = a->lhs()->result_type()->UnwrapAliasPtrAlias();
  auto* rhs_result_type = a->rhs()->result_type()->UnwrapAliasPtrAlias();
  if (lhs_result_type != rhs_result_type) {
    // TODO(sarahM0): figur out what should be the error number.
    set_error(a->source(), "v-000x: invalid assignment of '" +
                               lhs_result_type->type_name() + "' to '" +
                               rhs_result_type->type_name() + "'");
    return false;
  }
  return true;
}

bool ValidatorImpl::CheckImports(const ast::Module* module) {
  for (const auto& import : module->imports()) {
    if (import->path() != "GLSL.std.450") {
      set_error(import->source(), "v-0001: unknown import: " + import->path());
      return false;
    }
  }
  return true;
}

}  // namespace tint
