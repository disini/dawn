//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
float4 textureLoad_4542ae() {
  int2 arg_1 = (int(1)).xx;
  int arg_2 = int(1);
  int2 v = arg_1;
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  uint v_2 = min(uint(arg_2), (v_1.z - 1u));
  uint3 v_3 = (0u).xxx;
  arg_0.GetDimensions(v_3.x, v_3.y, v_3.z);
  uint2 v_4 = (v_3.xy - (1u).xx);
  int2 v_5 = int2(min(uint2(v), v_4));
  float4 res = float4(arg_0.Load(int4(v_5, int(v_2), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_4542ae()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
float4 textureLoad_4542ae() {
  int2 arg_1 = (int(1)).xx;
  int arg_2 = int(1);
  int2 v = arg_1;
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  uint v_2 = min(uint(arg_2), (v_1.z - 1u));
  uint3 v_3 = (0u).xxx;
  arg_0.GetDimensions(v_3.x, v_3.y, v_3.z);
  uint2 v_4 = (v_3.xy - (1u).xx);
  int2 v_5 = int2(min(uint2(v), v_4));
  float4 res = float4(arg_0.Load(int4(v_5, int(v_2), int(0))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_4542ae()));
}

