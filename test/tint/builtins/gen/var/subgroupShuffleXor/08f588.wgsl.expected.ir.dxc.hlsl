
RWByteAddressBuffer prevent_dce : register(u0);
uint4 subgroupShuffleXor_08f588() {
  uint4 arg_0 = (1u).xxxx;
  uint arg_1 = 1u;
  uint4 res = WaveReadLaneAt(arg_0, (WaveGetLaneIndex() ^ arg_1));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, subgroupShuffleXor_08f588());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, subgroupShuffleXor_08f588());
}

