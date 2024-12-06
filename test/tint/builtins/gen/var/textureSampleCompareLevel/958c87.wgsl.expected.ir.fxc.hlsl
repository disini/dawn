//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
TextureCubeArray arg_0 : register(t0, space1);
SamplerComparisonState arg_1 : register(s1, space1);
float textureSampleCompareLevel_958c87() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  float arg_4 = 1.0f;
  float3 v = arg_2;
  float v_1 = arg_4;
  float res = arg_0.SampleCmpLevelZero(arg_1, float4(v, float(arg_3)), v_1);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(textureSampleCompareLevel_958c87()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
TextureCubeArray arg_0 : register(t0, space1);
SamplerComparisonState arg_1 : register(s1, space1);
float textureSampleCompareLevel_958c87() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  float arg_4 = 1.0f;
  float3 v = arg_2;
  float v_1 = arg_4;
  float res = arg_0.SampleCmpLevelZero(arg_1, float4(v, float(arg_3)), v_1);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(textureSampleCompareLevel_958c87()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  float prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


TextureCubeArray arg_0 : register(t0, space1);
SamplerComparisonState arg_1 : register(s1, space1);
float textureSampleCompareLevel_958c87() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  float arg_4 = 1.0f;
  float3 v = arg_2;
  float v_1 = arg_4;
  float res = arg_0.SampleCmpLevelZero(arg_1, float4(v, float(arg_3)), v_1);
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleCompareLevel_958c87();
  VertexOutput v_2 = tint_symbol;
  return v_2;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_3 = vertex_main_inner();
  vertex_main_outputs v_4 = {v_3.prevent_dce, v_3.pos};
  return v_4;
}

