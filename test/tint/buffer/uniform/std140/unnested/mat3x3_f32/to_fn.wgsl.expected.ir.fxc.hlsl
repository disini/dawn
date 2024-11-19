
cbuffer cbuffer_u : register(b0) {
  uint4 u[3];
};
void a(float3x3 m) {
}

void b(float3 v) {
}

void c(float f_1) {
}

float3x3 v_1(uint start_byte_offset) {
  return float3x3(asfloat(u[(start_byte_offset / 16u)].xyz), asfloat(u[((16u + start_byte_offset) / 16u)].xyz), asfloat(u[((32u + start_byte_offset) / 16u)].xyz));
}

[numthreads(1, 1, 1)]
void f() {
  a(v_1(0u));
  b(asfloat(u[1u].xyz));
  b(asfloat(u[1u].xyz).zxy);
  c(asfloat(u[1u].x));
  c(asfloat(u[1u].xyz).zxy.x);
}

