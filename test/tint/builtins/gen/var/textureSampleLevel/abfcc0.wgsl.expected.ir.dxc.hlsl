//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture3D<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleLevel_abfcc0() {
  float3 arg_2 = (1.0f).xxx;
  float arg_3 = 1.0f;
  float3 v = arg_2;
  float4 res = arg_0.SampleLevel(arg_1, v, float(arg_3));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureSampleLevel_abfcc0()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture3D<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleLevel_abfcc0() {
  float3 arg_2 = (1.0f).xxx;
  float arg_3 = 1.0f;
  float3 v = arg_2;
  float4 res = arg_0.SampleLevel(arg_1, v, float(arg_3));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureSampleLevel_abfcc0()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  float4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


Texture3D<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleLevel_abfcc0() {
  float3 arg_2 = (1.0f).xxx;
  float arg_3 = 1.0f;
  float3 v = arg_2;
  float4 res = arg_0.SampleLevel(arg_1, v, float(arg_3));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleLevel_abfcc0();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.prevent_dce, v_2.pos};
  return v_3;
}

