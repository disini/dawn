void radians_44a9f8() {
  float2 res = (0.017453292f).xx;
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  radians_44a9f8();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  const float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  radians_44a9f8();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  radians_44a9f8();
  return;
}
