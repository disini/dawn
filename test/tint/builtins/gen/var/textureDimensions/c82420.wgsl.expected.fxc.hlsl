//
// fragment_main
//
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2D<uint4> arg_0 : register(u0, space1);

uint2 textureDimensions_c82420() {
  uint2 tint_tmp;
  arg_0.GetDimensions(tint_tmp.x, tint_tmp.y);
  uint2 res = tint_tmp;
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(textureDimensions_c82420()));
  return;
}
//
// compute_main
//
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2D<uint4> arg_0 : register(u0, space1);

uint2 textureDimensions_c82420() {
  uint2 tint_tmp;
  arg_0.GetDimensions(tint_tmp.x, tint_tmp.y);
  uint2 res = tint_tmp;
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(textureDimensions_c82420()));
  return;
}
