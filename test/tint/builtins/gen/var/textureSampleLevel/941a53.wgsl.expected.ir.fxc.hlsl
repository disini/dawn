//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
TextureCubeArray arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float textureSampleLevel_941a53() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  uint arg_4 = 1u;
  float3 v = arg_2;
  uint v_1 = arg_4;
  float4 v_2 = float4(v, float(arg_3));
  float res = arg_0.SampleLevel(arg_1, v_2, float(v_1)).x;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(textureSampleLevel_941a53()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
TextureCubeArray arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float textureSampleLevel_941a53() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  uint arg_4 = 1u;
  float3 v = arg_2;
  uint v_1 = arg_4;
  float4 v_2 = float4(v, float(arg_3));
  float res = arg_0.SampleLevel(arg_1, v_2, float(v_1)).x;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(textureSampleLevel_941a53()));
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
SamplerState arg_1 : register(s1, space1);
float textureSampleLevel_941a53() {
  float3 arg_2 = (1.0f).xxx;
  uint arg_3 = 1u;
  uint arg_4 = 1u;
  float3 v = arg_2;
  uint v_1 = arg_4;
  float4 v_2 = float4(v, float(arg_3));
  float res = arg_0.SampleLevel(arg_1, v_2, float(v_1)).x;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleLevel_941a53();
  VertexOutput v_3 = tint_symbol;
  return v_3;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_4 = vertex_main_inner();
  vertex_main_outputs v_5 = {v_4.prevent_dce, v_4.pos};
  return v_5;
}

