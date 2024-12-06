//
// fragment_main
//
RWByteAddressBuffer prevent_dce : register(u0);
ByteAddressBuffer sb_ro : register(t1);

uint arrayLength_cfca0a() {
  uint tint_symbol_1 = 0u;
  sb_ro.GetDimensions(tint_symbol_1);
  uint tint_symbol_2 = ((tint_symbol_1 - 0u) / 4u);
  uint res = tint_symbol_2;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(arrayLength_cfca0a()));
  return;
}
//
// compute_main
//
RWByteAddressBuffer prevent_dce : register(u0);
ByteAddressBuffer sb_ro : register(t1);

uint arrayLength_cfca0a() {
  uint tint_symbol_1 = 0u;
  sb_ro.GetDimensions(tint_symbol_1);
  uint tint_symbol_2 = ((tint_symbol_1 - 0u) / 4u);
  uint res = tint_symbol_2;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(arrayLength_cfca0a()));
  return;
}
//
// vertex_main
//
ByteAddressBuffer sb_ro : register(t1);

uint arrayLength_cfca0a() {
  uint tint_symbol_3 = 0u;
  sb_ro.GetDimensions(tint_symbol_3);
  uint tint_symbol_4 = ((tint_symbol_3 - 0u) / 4u);
  uint res = tint_symbol_4;
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
  tint_symbol.prevent_dce = arrayLength_cfca0a();
  return tint_symbol;
}

tint_symbol_1 vertex_main() {
  VertexOutput inner_result = vertex_main_inner();
  tint_symbol_1 wrapper_result = (tint_symbol_1)0;
  wrapper_result.pos = inner_result.pos;
  wrapper_result.prevent_dce = inner_result.prevent_dce;
  return wrapper_result;
}
