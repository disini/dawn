struct VertexOutput {
  float4 pos;
  float prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
Texture2DArray arg_0 : register(t0, space1);
SamplerComparisonState arg_1 : register(s1, space1);
float textureSampleCompareLevel_7dc3c0() {
  Texture2DArray v = arg_0;
  SamplerComparisonState v_1 = arg_1;
  float res = v.SampleCmpLevelZero(v_1, float3((1.0f).xx, float(1u)), 1.0f);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(textureSampleCompareLevel_7dc3c0()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(textureSampleCompareLevel_7dc3c0()));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleCompareLevel_7dc3c0();
  VertexOutput v_2 = tint_symbol;
  return v_2;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_3 = vertex_main_inner();
  VertexOutput v_4 = v_3;
  VertexOutput v_5 = v_3;
  vertex_main_outputs v_6 = {v_5.prevent_dce, v_4.pos};
  return v_6;
}

