//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int select_e3e028() {
  bool4 arg_0 = (true).xxxx;
  bool4 arg_1 = (true).xxxx;
  bool4 arg_2 = (true).xxxx;
  bool4 res = ((arg_2) ? (arg_1) : (arg_0));
  return ((all((res == (false).xxxx))) ? (int(1)) : (int(0)));
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(select_e3e028()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int select_e3e028() {
  bool4 arg_0 = (true).xxxx;
  bool4 arg_1 = (true).xxxx;
  bool4 arg_2 = (true).xxxx;
  bool4 res = ((arg_2) ? (arg_1) : (arg_0));
  return ((all((res == (false).xxxx))) ? (int(1)) : (int(0)));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(select_e3e028()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  int prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation int VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


int select_e3e028() {
  bool4 arg_0 = (true).xxxx;
  bool4 arg_1 = (true).xxxx;
  bool4 arg_2 = (true).xxxx;
  bool4 res = ((arg_2) ? (arg_1) : (arg_0));
  return ((all((res == (false).xxxx))) ? (int(1)) : (int(0)));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = select_e3e028();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

