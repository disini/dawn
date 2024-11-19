
cbuffer cbuffer_u : register(b0) {
  uint4 u[12];
};
RWByteAddressBuffer s : register(u1);
float a(float3x3 a_1[4]) {
  return a_1[int(0)][int(0)].x;
}

float b(float3x3 m) {
  return m[int(0)].x;
}

float c(float3 v) {
  return v.x;
}

float d(float f_1) {
  return f_1;
}

float3x3 v_1(uint start_byte_offset) {
  return float3x3(asfloat(u[(start_byte_offset / 16u)].xyz), asfloat(u[((16u + start_byte_offset) / 16u)].xyz), asfloat(u[((32u + start_byte_offset) / 16u)].xyz));
}

typedef float3x3 ary_ret[4];
ary_ret v_2(uint start_byte_offset) {
  float3x3 a_2[4] = (float3x3[4])0;
  {
    uint v_3 = 0u;
    v_3 = 0u;
    while(true) {
      uint v_4 = v_3;
      if ((v_4 >= 4u)) {
        break;
      }
      a_2[v_4] = v_1((start_byte_offset + (v_4 * 48u)));
      {
        v_3 = (v_4 + 1u);
      }
      continue;
    }
  }
  float3x3 v_5[4] = a_2;
  return v_5;
}

[numthreads(1, 1, 1)]
void f() {
  float3x3 v_6[4] = v_2(0u);
  float v_7 = a(v_6);
  float v_8 = (v_7 + b(v_1(48u)));
  float v_9 = (v_8 + c(asfloat(u[3u].xyz).zxy));
  s.Store(0u, asuint((v_9 + d(asfloat(u[3u].xyz).zxy.x))));
}

