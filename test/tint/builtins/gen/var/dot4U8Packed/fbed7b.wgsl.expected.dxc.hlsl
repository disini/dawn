//
// fragment_main
//
uint tint_dot4U8Packed(uint param_0, uint param_1) {
  uint accumulator = 0u;
  return dot4add_u8packed(param_0, param_1, accumulator);
}

RWByteAddressBuffer prevent_dce : register(u0);

uint dot4U8Packed_fbed7b() {
  uint arg_0 = 1u;
  uint arg_1 = 1u;
  uint res = tint_dot4U8Packed(arg_0, arg_1);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(dot4U8Packed_fbed7b()));
  return;
}
//
// compute_main
//
uint tint_dot4U8Packed(uint param_0, uint param_1) {
  uint accumulator = 0u;
  return dot4add_u8packed(param_0, param_1, accumulator);
}

RWByteAddressBuffer prevent_dce : register(u0);

uint dot4U8Packed_fbed7b() {
  uint arg_0 = 1u;
  uint arg_1 = 1u;
  uint res = tint_dot4U8Packed(arg_0, arg_1);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(dot4U8Packed_fbed7b()));
  return;
}
//
// vertex_main
//
uint tint_dot4U8Packed(uint param_0, uint param_1) {
  uint accumulator = 0u;
  return dot4add_u8packed(param_0, param_1, accumulator);
}

uint dot4U8Packed_fbed7b() {
  uint arg_0 = 1u;
  uint arg_1 = 1u;
  uint res = tint_dot4U8Packed(arg_0, arg_1);
  return res;
}

struct VertexOutput {
  float4 pos;
  uint prevent_dce;
};
struct tint_symbol_1 {
  nointerpolation uint prevent_dce : TEXCOORD0;
  float4 pos : SV_Position;
};

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = dot4U8Packed_fbed7b();
  return tint_symbol;
}

tint_symbol_1 vertex_main() {
  VertexOutput inner_result = vertex_main_inner();
  tint_symbol_1 wrapper_result = (tint_symbol_1)0;
  wrapper_result.pos = inner_result.pos;
  wrapper_result.prevent_dce = inner_result.prevent_dce;
  return wrapper_result;
}
