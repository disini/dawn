//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2DArray<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleGrad_2ecd8f() {
  float2 arg_2 = (1.0f).xx;
  int arg_3 = int(1);
  float2 arg_4 = (1.0f).xx;
  float2 arg_5 = (1.0f).xx;
  float2 v = arg_2;
  float2 v_1 = arg_4;
  float2 v_2 = arg_5;
  float4 res = arg_0.SampleGrad(arg_1, float3(v, float(arg_3)), v_1, v_2);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureSampleGrad_2ecd8f()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2DArray<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleGrad_2ecd8f() {
  float2 arg_2 = (1.0f).xx;
  int arg_3 = int(1);
  float2 arg_4 = (1.0f).xx;
  float2 arg_5 = (1.0f).xx;
  float2 v = arg_2;
  float2 v_1 = arg_4;
  float2 v_2 = arg_5;
  float4 res = arg_0.SampleGrad(arg_1, float3(v, float(arg_3)), v_1, v_2);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureSampleGrad_2ecd8f()));
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


Texture2DArray<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleGrad_2ecd8f() {
  float2 arg_2 = (1.0f).xx;
  int arg_3 = int(1);
  float2 arg_4 = (1.0f).xx;
  float2 arg_5 = (1.0f).xx;
  float2 v = arg_2;
  float2 v_1 = arg_4;
  float2 v_2 = arg_5;
  float4 res = arg_0.SampleGrad(arg_1, float3(v, float(arg_3)), v_1, v_2);
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleGrad_2ecd8f();
  VertexOutput v_3 = tint_symbol;
  return v_3;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_4 = vertex_main_inner();
  vertex_main_outputs v_5 = {v_4.prevent_dce, v_4.pos};
  return v_5;
}

