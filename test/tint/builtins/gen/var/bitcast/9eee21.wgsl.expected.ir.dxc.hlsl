//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int3 bitcast_9eee21() {
  int3 arg_0 = (int(1)).xxx;
  int3 res = arg_0;
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(bitcast_9eee21()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
int3 bitcast_9eee21() {
  int3 arg_0 = (int(1)).xxx;
  int3 res = arg_0;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(bitcast_9eee21()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  int3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation int3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


int3 bitcast_9eee21() {
  int3 arg_0 = (int(1)).xxx;
  int3 res = arg_0;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = bitcast_9eee21();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

