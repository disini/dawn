//
// fragment_main
//
float4 tint_unpack4x8unorm(uint param_0) {
  uint j = param_0;
  uint4 i = uint4(j & 0xff, (j >> 8) & 0xff, (j >> 16) & 0xff, j >> 24);
  return float4(i) / 255.0;
}

RWByteAddressBuffer prevent_dce : register(u0);

float4 unpack4x8unorm_750c74() {
  uint arg_0 = 1u;
  float4 res = tint_unpack4x8unorm(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(unpack4x8unorm_750c74()));
  return;
}
//
// compute_main
//
float4 tint_unpack4x8unorm(uint param_0) {
  uint j = param_0;
  uint4 i = uint4(j & 0xff, (j >> 8) & 0xff, (j >> 16) & 0xff, j >> 24);
  return float4(i) / 255.0;
}

RWByteAddressBuffer prevent_dce : register(u0);

float4 unpack4x8unorm_750c74() {
  uint arg_0 = 1u;
  float4 res = tint_unpack4x8unorm(arg_0);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(unpack4x8unorm_750c74()));
  return;
}
//
// vertex_main
//
float4 tint_unpack4x8unorm(uint param_0) {
  uint j = param_0;
  uint4 i = uint4(j & 0xff, (j >> 8) & 0xff, (j >> 16) & 0xff, j >> 24);
  return float4(i) / 255.0;
}

float4 unpack4x8unorm_750c74() {
  uint arg_0 = 1u;
  float4 res = tint_unpack4x8unorm(arg_0);
  return res;
}

struct VertexOutput {
  float4 pos;
  float4 prevent_dce;
};
struct tint_symbol_1 {
  nointerpolation float4 prevent_dce : TEXCOORD0;
  float4 pos : SV_Position;
};

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = unpack4x8unorm_750c74();
  return tint_symbol;
}

tint_symbol_1 vertex_main() {
  VertexOutput inner_result = vertex_main_inner();
  tint_symbol_1 wrapper_result = (tint_symbol_1)0;
  wrapper_result.pos = inner_result.pos;
  wrapper_result.prevent_dce = inner_result.prevent_dce;
  return wrapper_result;
}
