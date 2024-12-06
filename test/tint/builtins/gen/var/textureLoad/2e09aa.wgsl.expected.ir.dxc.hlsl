//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2DMS<float4> arg_0 : register(t0, space1);
float4 textureLoad_2e09aa() {
  uint2 arg_1 = (1u).xx;
  uint arg_2 = 1u;
  uint v = arg_2;
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  int2 v_2 = int2(min(arg_1, (v_1.xy - (1u).xx)));
  float4 res = float4(arg_0.Load(v_2, int(v)));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_2e09aa()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2DMS<float4> arg_0 : register(t0, space1);
float4 textureLoad_2e09aa() {
  uint2 arg_1 = (1u).xx;
  uint arg_2 = 1u;
  uint v = arg_2;
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  int2 v_2 = int2(min(arg_1, (v_1.xy - (1u).xx)));
  float4 res = float4(arg_0.Load(v_2, int(v)));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_2e09aa()));
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


Texture2DMS<float4> arg_0 : register(t0, space1);
float4 textureLoad_2e09aa() {
  uint2 arg_1 = (1u).xx;
  uint arg_2 = 1u;
  uint v = arg_2;
  uint3 v_1 = (0u).xxx;
  arg_0.GetDimensions(v_1.x, v_1.y, v_1.z);
  int2 v_2 = int2(min(arg_1, (v_1.xy - (1u).xx)));
  float4 res = float4(arg_0.Load(v_2, int(v)));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureLoad_2e09aa();
  VertexOutput v_3 = tint_symbol;
  return v_3;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_4 = vertex_main_inner();
  vertex_main_outputs v_5 = {v_4.prevent_dce, v_4.pos};
  return v_5;
}

