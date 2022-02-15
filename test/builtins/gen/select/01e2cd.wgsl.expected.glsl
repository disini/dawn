#version 310 es

void select_01e2cd() {
  ivec3 res = mix(ivec3(0, 0, 0), ivec3(0, 0, 0), bvec3(false, false, false));
}

vec4 vertex_main() {
  select_01e2cd();
  return vec4(0.0f, 0.0f, 0.0f, 0.0f);
}

void main() {
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision mediump float;

void select_01e2cd() {
  ivec3 res = mix(ivec3(0, 0, 0), ivec3(0, 0, 0), bvec3(false, false, false));
}

void fragment_main() {
  select_01e2cd();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

void select_01e2cd() {
  ivec3 res = mix(ivec3(0, 0, 0), ivec3(0, 0, 0), bvec3(false, false, false));
}

void compute_main() {
  select_01e2cd();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
