[numthreads(1, 1, 1)]
void unused_entry_point() {
  return;
}

static const float2x2 m = float2x2(float2(0.0f, 1.0f), float2(2.0f, 3.0f));

float2x2 f() {
  const float2x2 m_1 = float2x2(float2(0.0f, 1.0f), float2(2.0f, 3.0f));
  return float2x2(float2(0.0f, 1.0f), float2(2.0f, 3.0f));
}
