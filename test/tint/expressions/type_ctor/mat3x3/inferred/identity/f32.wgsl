let m = mat3x3(mat3x3(0.0f, 1.0f, 2.0f,
                      3.0f, 4.0f, 5.0f,
                      6.0f, 7.0f, 8.0f));

fn f() -> mat3x3<f32> {
    let m_1 = mat3x3(m);
    return m_1;
}
