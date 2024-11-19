struct modf_result_vec3_f16 {
  vector<float16_t, 3> fract;
  vector<float16_t, 3> whole;
};

struct VertexOutput {
  float4 pos;
};

struct vertex_main_outputs {
  float4 VertexOutput_pos : SV_Position;
};


void modf_45005f() {
  vector<float16_t, 3> arg_0 = (float16_t(-1.5h)).xxx;
  vector<float16_t, 3> v = (float16_t(0.0h)).xxx;
  modf_result_vec3_f16 res = {modf(arg_0, v), v};
}

void fragment_main() {
  modf_45005f();
}

[numthreads(1, 1, 1)]
void compute_main() {
  modf_45005f();
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  modf_45005f();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.pos};
  return v_3;
}

