#version 310 es

shared mat2x4 S;
void tint_zero_workgroup_memory(uint local_idx) {
  {
    S = mat2x4(vec4(0.0f), vec4(0.0f));
  }
  barrier();
}

vec4 func_S_X(uint pointer[1]) {
  return S[pointer[0]];
}

void tint_symbol(uint local_invocation_index) {
  tint_zero_workgroup_memory(local_invocation_index);
  uint tint_symbol_1[1] = uint[1](1u);
  vec4 r = func_S_X(tint_symbol_1);
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol(gl_LocalInvocationIndex);
  return;
}
