//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float3 cross_041cb0() {
  float3 res = (0.0f).xxx;
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(cross_041cb0()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float3 cross_041cb0() {
  float3 res = (0.0f).xxx;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(cross_041cb0()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  float3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


float3 cross_041cb0() {
  float3 res = (0.0f).xxx;
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = cross_041cb0();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

