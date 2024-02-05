#version 310 es

shared int arg_0;
void tint_zero_workgroup_memory(uint local_idx) {
  {
    atomicExchange(arg_0, 0);
  }
  barrier();
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  int inner;
} prevent_dce;

void atomicExchange_e114ba() {
  int res = atomicExchange(arg_0, 1);
  prevent_dce.inner = res;
}

void compute_main(uint local_invocation_index) {
  tint_zero_workgroup_memory(local_invocation_index);
  atomicExchange_e114ba();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main(gl_LocalInvocationIndex);
  return;
}
