//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float determinant_e19305() {
  float2x2 arg_0 = float2x2((1.0f).xx, (1.0f).xx);
  float res = determinant(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(determinant_e19305()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float determinant_e19305() {
  float2x2 arg_0 = float2x2((1.0f).xx, (1.0f).xx);
  float res = determinant(arg_0);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(determinant_e19305()));
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


float determinant_e19305() {
  float2x2 arg_0 = float2x2((1.0f).xx, (1.0f).xx);
  float res = determinant(arg_0);
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = determinant_e19305();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

