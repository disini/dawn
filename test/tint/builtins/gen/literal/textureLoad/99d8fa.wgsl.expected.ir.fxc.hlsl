//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture3D<float4> arg_0 : register(u0, space1);
float4 textureLoad_99d8fa() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint3 v_1 = (v - (1u).xxx);
  float4 res = float4(arg_0.Load(int4(int3(min(uint3((int(1)).xxx), v_1)), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_99d8fa()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture3D<float4> arg_0 : register(u0, space1);
float4 textureLoad_99d8fa() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint3 v_1 = (v - (1u).xxx);
  float4 res = float4(arg_0.Load(int4(int3(min(uint3((int(1)).xxx), v_1)), int(0))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_99d8fa()));
}

