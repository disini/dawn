//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<uint4> arg_0 : register(u0, space1);
uint4 textureLoad_3a2350() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  uint2 v_2 = (v_1.xy - (1u).xx);
  int2 v_3 = int2(min(uint2((int(1)).xx), v_2));
  uint4 res = uint4(arg_0.Load(int4(v_3, int(min(1u, (v.z - 1u))), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureLoad_3a2350());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<uint4> arg_0 : register(u0, space1);
uint4 textureLoad_3a2350() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  uint2 v_2 = (v_1.xy - (1u).xx);
  int2 v_3 = int2(min(uint2((int(1)).xx), v_2));
  uint4 res = uint4(arg_0.Load(int4(v_3, int(min(1u, (v.z - 1u))), int(0))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureLoad_3a2350());
}

