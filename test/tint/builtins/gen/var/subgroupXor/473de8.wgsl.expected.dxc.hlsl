//
// fragment_main
//
RWByteAddressBuffer prevent_dce : register(u0);

int2 subgroupXor_473de8() {
  int2 arg_0 = (1).xx;
  int2 res = asint(WaveActiveBitXor(asuint(arg_0)));
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(subgroupXor_473de8()));
  return;
}
//
// compute_main
//
RWByteAddressBuffer prevent_dce : register(u0);

int2 subgroupXor_473de8() {
  int2 arg_0 = (1).xx;
  int2 res = asint(WaveActiveBitXor(asuint(arg_0)));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(subgroupXor_473de8()));
  return;
}
