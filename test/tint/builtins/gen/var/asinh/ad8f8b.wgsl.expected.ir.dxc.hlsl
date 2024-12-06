//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 2> asinh_ad8f8b() {
  vector<float16_t, 2> arg_0 = (float16_t(1.0h)).xx;
  vector<float16_t, 2> v = arg_0;
  vector<float16_t, 2> res = log((v + sqrt(((v * v) + (float16_t(1.0h)).xx))));
  return res;
}

void fragment_main() {
  prevent_dce.Store<vector<float16_t, 2> >(0u, asinh_ad8f8b());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 2> asinh_ad8f8b() {
  vector<float16_t, 2> arg_0 = (float16_t(1.0h)).xx;
  vector<float16_t, 2> v = arg_0;
  vector<float16_t, 2> res = log((v + sqrt(((v * v) + (float16_t(1.0h)).xx))));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<vector<float16_t, 2> >(0u, asinh_ad8f8b());
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  vector<float16_t, 2> prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation vector<float16_t, 2> VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


vector<float16_t, 2> asinh_ad8f8b() {
  vector<float16_t, 2> arg_0 = (float16_t(1.0h)).xx;
  vector<float16_t, 2> v = arg_0;
  vector<float16_t, 2> res = log((v + sqrt(((v * v) + (float16_t(1.0h)).xx))));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = asinh_ad8f8b();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.prevent_dce, v_2.pos};
  return v_3;
}

