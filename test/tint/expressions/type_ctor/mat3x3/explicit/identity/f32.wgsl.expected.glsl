#version 310 es

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
const mat3 m = mat3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f), vec3(6.0f, 7.0f, 8.0f));
mat3 f() {
  mat3 m_1 = mat3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f), vec3(6.0f, 7.0f, 8.0f));
  return mat3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f), vec3(6.0f, 7.0f, 8.0f));
}

