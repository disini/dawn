
cbuffer cbuffer_m : register(b0) {
  uint4 m[3];
};
static int counter = int(0);
int i() {
  counter = (counter + int(1));
  return counter;
}

float3x4 v(uint start_byte_offset) {
  return float3x4(asfloat(m[(start_byte_offset / 16u)]), asfloat(m[((16u + start_byte_offset) / 16u)]), asfloat(m[((32u + start_byte_offset) / 16u)]));
}

[numthreads(1, 1, 1)]
void f() {
  uint v_1 = (16u * uint(i()));
  float3x4 l_m = v(0u);
  float4 l_m_i = asfloat(m[(v_1 / 16u)]);
}

