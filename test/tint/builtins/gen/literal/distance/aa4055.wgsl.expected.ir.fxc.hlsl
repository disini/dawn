//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float distance_aa4055() {
  float res = 0.0f;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(distance_aa4055()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float distance_aa4055() {
  float res = 0.0f;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(distance_aa4055()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  float prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


float distance_aa4055() {
  float res = 0.0f;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = distance_aa4055();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

