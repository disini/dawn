//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
uint2 extractBits_f28f69() {
  uint2 arg_0 = (1u).xx;
  uint arg_1 = 1u;
  uint arg_2 = 1u;
  uint2 v = arg_0;
  uint v_1 = min(arg_1, 32u);
  uint v_2 = (32u - min(32u, (v_1 + arg_2)));
  uint2 v_3 = (((v_2 < 32u)) ? ((v << uint2((v_2).xx))) : ((0u).xx));
  uint2 res = ((((v_2 + v_1) < 32u)) ? ((v_3 >> uint2(((v_2 + v_1)).xx))) : (((v_3 >> (31u).xx) >> (1u).xx)));
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, extractBits_f28f69());
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
uint2 extractBits_f28f69() {
  uint2 arg_0 = (1u).xx;
  uint arg_1 = 1u;
  uint arg_2 = 1u;
  uint2 v = arg_0;
  uint v_1 = min(arg_1, 32u);
  uint v_2 = (32u - min(32u, (v_1 + arg_2)));
  uint2 v_3 = (((v_2 < 32u)) ? ((v << uint2((v_2).xx))) : ((0u).xx));
  uint2 res = ((((v_2 + v_1) < 32u)) ? ((v_3 >> uint2(((v_2 + v_1)).xx))) : (((v_3 >> (31u).xx) >> (1u).xx)));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, extractBits_f28f69());
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  uint2 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint2 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


uint2 extractBits_f28f69() {
  uint2 arg_0 = (1u).xx;
  uint arg_1 = 1u;
  uint arg_2 = 1u;
  uint2 v = arg_0;
  uint v_1 = min(arg_1, 32u);
  uint v_2 = (32u - min(32u, (v_1 + arg_2)));
  uint2 v_3 = (((v_2 < 32u)) ? ((v << uint2((v_2).xx))) : ((0u).xx));
  uint2 res = ((((v_2 + v_1) < 32u)) ? ((v_3 >> uint2(((v_2 + v_1)).xx))) : (((v_3 >> (31u).xx) >> (1u).xx)));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = extractBits_f28f69();
  VertexOutput v_4 = tint_symbol;
  return v_4;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_5 = vertex_main_inner();
  vertex_main_outputs v_6 = {v_5.prevent_dce, v_5.pos};
  return v_6;
}

