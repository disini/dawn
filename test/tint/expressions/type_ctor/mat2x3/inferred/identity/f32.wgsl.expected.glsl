#version 310 es

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
const mat2x3 m = mat2x3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f));
mat2x3 f() {
  mat2x3 m_1 = mat2x3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f));
  return mat2x3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f));
}

