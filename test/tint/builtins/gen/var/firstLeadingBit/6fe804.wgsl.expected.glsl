#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  uvec2 inner;
} v;
uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 v_1 = arg_0;
  uvec2 res = mix((mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u))) | (mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u))) | (mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u))) | (mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u))) | mix(uvec2(1u), uvec2(0u), equal((((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))) & uvec2(2u)), uvec2(0u))))))), uvec2(4294967295u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))), uvec2(0u)));
  return res;
}
void main() {
  v.inner = firstLeadingBit_6fe804();
}
#version 310 es

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  uvec2 inner;
} v;
uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 v_1 = arg_0;
  uvec2 res = mix((mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u))) | (mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u))) | (mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u))) | (mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u))) | mix(uvec2(1u), uvec2(0u), equal((((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))) & uvec2(2u)), uvec2(0u))))))), uvec2(4294967295u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v_1 >> mix(uvec2(16u), uvec2(0u), equal((v_1 & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))), uvec2(0u)));
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.inner = firstLeadingBit_6fe804();
}
#version 310 es


struct VertexOutput {
  vec4 pos;
  uvec2 prevent_dce;
};

layout(location = 0) flat out uvec2 vertex_main_loc0_Output;
uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 v = arg_0;
  uvec2 res = mix((mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u))) | (mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u))) | (mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u))) | (mix(uvec2(2u), uvec2(0u), equal(((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u))) | mix(uvec2(1u), uvec2(0u), equal((((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))) & uvec2(2u)), uvec2(0u))))))), uvec2(4294967295u), equal(((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) >> mix(uvec2(2u), uvec2(0u), equal(((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) >> mix(uvec2(4u), uvec2(0u), equal((((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) >> mix(uvec2(8u), uvec2(0u), equal(((v >> mix(uvec2(16u), uvec2(0u), equal((v & uvec2(4294901760u)), uvec2(0u)))) & uvec2(65280u)), uvec2(0u)))) & uvec2(240u)), uvec2(0u)))) & uvec2(12u)), uvec2(0u)))), uvec2(0u)));
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), uvec2(0u));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = firstLeadingBit_6fe804();
  return tint_symbol;
}
void main() {
  VertexOutput v_1 = vertex_main_inner();
  gl_Position = v_1.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v_1.prevent_dce;
  gl_PointSize = 1.0f;
}
