//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture3D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_e59fdf() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint4 res = uint4(arg_0.Load(int4(int3(min((1u).xxx, (v - (1u).xxx))), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureLoad_e59fdf());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
Texture3D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_e59fdf() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint4 res = uint4(arg_0.Load(int4(int3(min((1u).xxx, (v - (1u).xxx))), int(0))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureLoad_e59fdf());
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


Texture3D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_e59fdf() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v.x, v.y, v.z);
  uint4 res = uint4(arg_0.Load(int4(int3(min((1u).xxx, (v - (1u).xxx))), int(0))));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureLoad_e59fdf();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.prevent_dce, v_2.pos};
  return v_3;
}

