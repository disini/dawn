//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<float4> arg_1 : register(t1, space1);
SamplerState arg_2 : register(s2, space1);
float4 textureGather_af55b3() {
  float2 arg_3 = (1.0f).xx;
  float4 res = arg_1.GatherGreen(arg_2, arg_3, (int(1)).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureGather_af55b3()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<float4> arg_1 : register(t1, space1);
SamplerState arg_2 : register(s2, space1);
float4 textureGather_af55b3() {
  float2 arg_3 = (1.0f).xx;
  float4 res = arg_1.GatherGreen(arg_2, arg_3, (int(1)).xx);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureGather_af55b3()));
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


Texture2D<float4> arg_1 : register(t1, space1);
SamplerState arg_2 : register(s2, space1);
float4 textureGather_af55b3() {
  float2 arg_3 = (1.0f).xx;
  float4 res = arg_1.GatherGreen(arg_2, arg_3, (int(1)).xx);
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureGather_af55b3();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

