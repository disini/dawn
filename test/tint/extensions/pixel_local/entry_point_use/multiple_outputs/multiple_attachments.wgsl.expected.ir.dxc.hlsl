struct PixelLocal {
  uint a;
  int b;
  float c;
};

struct Out {
  float4 x;
  float4 y;
  float4 z;
};

struct f_outputs {
  float4 Out_x : SV_Target0;
  float4 Out_y : SV_Target2;
  float4 Out_z : SV_Target4;
};

struct f_inputs {
  float4 pos : SV_Position;
};


static PixelLocal P = (PixelLocal)0;
RasterizerOrderedTexture2D<uint4> pixel_local_a : register(u1);
RasterizerOrderedTexture2D<int4> pixel_local_b : register(u6);
RasterizerOrderedTexture2D<float4> pixel_local_c : register(u3);
Out f_inner() {
  P.a = (P.a + 42u);
  Out v = {(10.0f).xxxx, (20.0f).xxxx, (30.0f).xxxx};
  return v;
}

f_outputs f(f_inputs inputs) {
  uint2 v_1 = uint2(inputs.pos.xy);
  P.a = pixel_local_a.Load(v_1).x;
  P.b = pixel_local_b.Load(v_1).x;
  P.c = pixel_local_c.Load(v_1).x;
  Out v_2 = f_inner();
  Out v_3 = v_2;
  Out v_4 = v_2;
  Out v_5 = v_2;
  f_outputs v_6 = {v_3.x, v_4.y, v_5.z};
  pixel_local_a[v_1] = P.a.xxxx;
  pixel_local_b[v_1] = P.b.xxxx;
  pixel_local_c[v_1] = P.c.xxxx;
  f_outputs v_7 = v_6;
  return v_7;
}

