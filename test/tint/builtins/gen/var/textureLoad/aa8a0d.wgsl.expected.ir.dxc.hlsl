//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_aa8a0d() {
  uint2 arg_1 = (1u).xx;
  uint2 v = (0u).xx;
  arg_0.GetDimensions(v.x, v.y);
  uint4 res = uint4(arg_0.Load(int3(int2(min(arg_1, (v - (1u).xx))), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureLoad_aa8a0d());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_aa8a0d() {
  uint2 arg_1 = (1u).xx;
  uint2 v = (0u).xx;
  arg_0.GetDimensions(v.x, v.y);
  uint4 res = uint4(arg_0.Load(int3(int2(min(arg_1, (v - (1u).xx))), int(0))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureLoad_aa8a0d());
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  uint4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


Texture2D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_aa8a0d() {
  uint2 arg_1 = (1u).xx;
  uint2 v = (0u).xx;
  arg_0.GetDimensions(v.x, v.y);
  uint4 res = uint4(arg_0.Load(int3(int2(min(arg_1, (v - (1u).xx))), int(0))));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureLoad_aa8a0d();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.prevent_dce, v_2.pos};
  return v_3;
}

