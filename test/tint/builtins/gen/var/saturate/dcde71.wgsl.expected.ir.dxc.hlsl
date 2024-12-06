//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 4> saturate_dcde71() {
  vector<float16_t, 4> arg_0 = (float16_t(2.0h)).xxxx;
  vector<float16_t, 4> res = saturate(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store<vector<float16_t, 4> >(0u, saturate_dcde71());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 4> saturate_dcde71() {
  vector<float16_t, 4> arg_0 = (float16_t(2.0h)).xxxx;
  vector<float16_t, 4> res = saturate(arg_0);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<vector<float16_t, 4> >(0u, saturate_dcde71());
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  vector<float16_t, 4> prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation vector<float16_t, 4> VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


vector<float16_t, 4> saturate_dcde71() {
  vector<float16_t, 4> arg_0 = (float16_t(2.0h)).xxxx;
  vector<float16_t, 4> res = saturate(arg_0);
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = saturate_dcde71();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

