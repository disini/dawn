//
// fragment_main
//

void log2_0fbd39() {
  float3 res = (0.0f).xxx;
}

void fragment_main() {
  log2_0fbd39();
}

//
// compute_main
//

void log2_0fbd39() {
  float3 res = (0.0f).xxx;
}

[numthreads(1, 1, 1)]
void compute_main() {
  log2_0fbd39();
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


void log2_0fbd39() {
  float3 res = (0.0f).xxx;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  log2_0fbd39();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.pos};
  return v_2;
}

