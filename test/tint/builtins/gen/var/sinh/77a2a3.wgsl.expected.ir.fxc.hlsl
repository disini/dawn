//
// fragment_main
//

void sinh_77a2a3() {
  float3 res = (1.17520117759704589844f).xxx;
}

void fragment_main() {
  sinh_77a2a3();
}

//
// compute_main
//

void sinh_77a2a3() {
  float3 res = (1.17520117759704589844f).xxx;
}

[numthreads(1, 1, 1)]
void compute_main() {
  sinh_77a2a3();
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
};

struct vertex_main_outputs {
  float4 VertexOutput_pos : SV_Position;
};


void sinh_77a2a3() {
  float3 res = (1.17520117759704589844f).xxx;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  sinh_77a2a3();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.pos};
  return v_2;
}

