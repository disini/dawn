//
// fragment_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float2 unpack2x16float_32a5cf() {
  uint arg_0 = 1u;
  uint v = arg_0;
  float2 res = f16tof32(uint2((v & 65535u), (v >> 16u)));
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(unpack2x16float_32a5cf()));
}

//
// compute_main
//

RWByteAddressBuffer prevent_dce : register(u0);
float2 unpack2x16float_32a5cf() {
  uint arg_0 = 1u;
  uint v = arg_0;
  float2 res = f16tof32(uint2((v & 65535u), (v >> 16u)));
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(unpack2x16float_32a5cf()));
}

//
// vertex_main
//
struct VertexOutput {
  float4 pos;
  float2 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float2 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


float2 unpack2x16float_32a5cf() {
  uint arg_0 = 1u;
  uint v = arg_0;
  float2 res = f16tof32(uint2((v & 65535u), (v >> 16u)));
  return res;
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = unpack2x16float_32a5cf();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  vertex_main_outputs v_3 = {v_2.prevent_dce, v_2.pos};
  return v_3;
}

