//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int transpose_d6faec() {
  matrix<float16_t, 2, 3> arg_0 = matrix<float16_t, 2, 3>((float16_t(1.0h)).xxx, (float16_t(1.0h)).xxx);
  matrix<float16_t, 3, 2> res = transpose(arg_0);
  return (((res[0u].x == float16_t(0.0h))) ? (int(1)) : (int(0)));
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(transpose_d6faec()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int transpose_d6faec() {
  matrix<float16_t, 2, 3> arg_0 = matrix<float16_t, 2, 3>((float16_t(1.0h)).xxx, (float16_t(1.0h)).xxx);
  matrix<float16_t, 3, 2> res = transpose(arg_0);
  return (((res[0u].x == float16_t(0.0h))) ? (int(1)) : (int(0)));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(transpose_d6faec()));
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


int transpose_d6faec() {
  matrix<float16_t, 2, 3> arg_0 = matrix<float16_t, 2, 3>((float16_t(1.0h)).xxx, (float16_t(1.0h)).xxx);
  matrix<float16_t, 3, 2> res = transpose(arg_0);
  return (((res[0u].x == float16_t(0.0h))) ? (int(1)) : (int(0)));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = transpose_d6faec();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

