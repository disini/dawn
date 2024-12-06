//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int3 select_01e2cd() {
  int3 res = (int(1)).xxx;
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(select_01e2cd()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int3 select_01e2cd() {
  int3 res = (int(1)).xxx;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(select_01e2cd()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  int3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation int3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


int3 select_01e2cd() {
  int3 res = (int(1)).xxx;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = select_01e2cd();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

