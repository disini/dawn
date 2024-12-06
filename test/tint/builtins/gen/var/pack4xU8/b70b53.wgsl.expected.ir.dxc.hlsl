//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
uint pack4xU8_b70b53() {
  uint4 arg_0 = (1u).xxxx;
  uint res = uint(pack_u8(arg_0));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, pack4xU8_b70b53());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
uint pack4xU8_b70b53() {
  uint4 arg_0 = (1u).xxxx;
  uint res = uint(pack_u8(arg_0));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, pack4xU8_b70b53());
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  uint prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


uint pack4xU8_b70b53() {
  uint4 arg_0 = (1u).xxxx;
  uint res = uint(pack_u8(arg_0));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = pack4xU8_b70b53();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

