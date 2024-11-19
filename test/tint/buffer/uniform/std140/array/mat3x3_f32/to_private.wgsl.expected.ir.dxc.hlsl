
cbuffer cbuffer_u : register(b0) {
  uint4 u[12];
};
RWByteAddressBuffer s : register(u1);
static float3x3 p[4] = (float3x3[4])0;
float3x3 v(uint start_byte_offset) {
  return float3x3(asfloat(u[(start_byte_offset / 16u)].xyz), asfloat(u[((16u + start_byte_offset) / 16u)].xyz), asfloat(u[((32u + start_byte_offset) / 16u)].xyz));
}

typedef float3x3 ary_ret[4];
ary_ret v_1(uint start_byte_offset) {
  float3x3 a[4] = (float3x3[4])0;
  {
    uint v_2 = 0u;
    v_2 = 0u;
    while(true) {
      uint v_3 = v_2;
      if ((v_3 >= 4u)) {
        break;
      }
      a[v_3] = v((start_byte_offset + (v_3 * 48u)));
      {
        v_2 = (v_3 + 1u);
      }
      continue;
    }
  }
  float3x3 v_4[4] = a;
  return v_4;
}

[numthreads(1, 1, 1)]
void f() {
  float3x3 v_5[4] = v_1(0u);
  p = v_5;
  p[int(1)] = v(96u);
  p[int(1)][int(0)] = asfloat(u[1u].xyz).zxy;
  p[int(1)][int(0)].x = asfloat(u[1u].x);
  s.Store(0u, asuint(p[int(1)][int(0)].x));
}

