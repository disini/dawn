//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int bitcast_7e67cc() {
  int arg_0 = int(1);
  int res = arg_0;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(bitcast_7e67cc()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int bitcast_7e67cc() {
  int arg_0 = int(1);
  int res = arg_0;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(bitcast_7e67cc()));
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


int bitcast_7e67cc() {
  int arg_0 = int(1);
  int res = arg_0;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = bitcast_7e67cc();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

