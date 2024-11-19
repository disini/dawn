struct modf_result_vec3_f32 {
  float3 fract;
  float3 whole;
};

struct VertexOutput {
  float4 pos;
};

struct vertex_main_outputs {
  float4 VertexOutput_pos : SV_Position;
};


void modf_5ea256() {
  float3 arg_0 = (-1.5f).xxx;
  float3 v = (0.0f).xxx;
  modf_result_vec3_f32 res = {modf(arg_0, v), v};
}

void fragment_main() {
  modf_5ea256();
}

[numthreads(1, 1, 1)]
void compute_main() {
  modf_5ea256();
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  modf_5ea256();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.pos};
  return v_3;
}

