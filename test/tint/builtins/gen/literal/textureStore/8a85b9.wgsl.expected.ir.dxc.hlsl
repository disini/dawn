//
// fragment_main
//

RWTexture2DArray<int4> arg_0 : register(u0, space1);
void textureStore_8a85b9() {
  arg_0[int3((int(1)).xx, int(int(1)))] = (int(1)).xxxx;
}

void fragment_main() {
  textureStore_8a85b9();
}

//
// compute_main
//

RWTexture2DArray<int4> arg_0 : register(u0, space1);
void textureStore_8a85b9() {
  arg_0[int3((int(1)).xx, int(int(1)))] = (int(1)).xxxx;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_8a85b9();
}

