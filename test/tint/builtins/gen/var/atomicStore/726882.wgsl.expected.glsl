#version 310 es

shared uint arg_0;
void tint_zero_workgroup_memory(uint local_idx) {
  {
    atomicExchange(arg_0, 0u);
  }
  barrier();
}

void atomicStore_726882() {
  uint arg_1 = 1u;
  atomicExchange(arg_0, arg_1);
}

void compute_main(uint local_invocation_index) {
  tint_zero_workgroup_memory(local_invocation_index);
  atomicStore_726882();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main(gl_LocalInvocationIndex);
  return;
}
