R = PolynomialRing(QQ, "x")
x = R.gen()
k_1 = var("k_1")
k_2 = var("k_2")
k_3 = var("k_3")
k_4 = var("k_4")
k_5 = var("k_5")

a_1 = var("a_1")
a_2 = var("a_2")
a_3 = var("a_3")

b_1 = var("b_1")
b_2 = var("b_2")
b_3 = var("b_3")

c_1 = var("c_1")
c_2 = var("c_2")
c_3 = var("c_3")

d_1 = var("d_1")
d_2 = var("d_2")
d_3 = var("d_3")

e_1 = var("e_1")
e_2 = var("e_2")
e_3 = var("e_3")

f_1 = var("f_1")
f_2 = var("f_2")
f_3 = var("f_3")

g_1 = var("g_1")
g_2 = var("g_2")
g_3 = var("g_3")

h_1 = var("h_1")
h_2 = var("h_2")
h_3 = var("h_3")

i_1 = var("i_1")
i_2 = var("i_2")
i_3 = var("i_3")

j_1 = var("j_1")
j_2 = var("j_2")
j_3 = var("j_3")


u_1 = var("u_1")
u_2 = var("u_2")
u_3 = var("u_3")

r = var("r")

# Now, I want set k_1 = X^2 + 2X + 3, how to do that?
# E2 = E(k_1=x ^ 2 + 2 * x + 3)
# show(E2.expand())

# degree 2
E_1 = k_1 * a_1 * b_1 + u_1 * k_2 * c_1 + u_1 ^ 2 * k_3
E_2 = k_1 * a_2 * b_2 + u_2 * k_2 * c_2 + u_2 ^ 2 * k_3

a_3 = a_1 + r * a_2
b_3 = b_1 + r * b_2
c_3 = c_1 + r * c_2
u_3 = u_1 + r * u_2

E_3 = k_1 * a_3 * b_3 + u_3 * k_2 * c_3 + u_3 ^ 2 * k_3
show(E_3.expand())
T = (E_3 - E_1 - r ^ 2 * E_2) / r
print("T = ")
show(T.expand())

# degree 3
E_1 = (
    k_1 * a_1 * b_1 * c_1 + u_1 * k_2 * d_1 * e_1 + u_1 ^ 2 * k_3 * f_1 + u_1 ^ 3 * k_4
)
E_2 = (
    k_1 * a_2 * b_2 * c_2 + u_2 * k_2 * d_2 * e_2 + u_2 ^ 2 * k_3 * f_2 + u_2 ^ 3 * k_4
)

d_3 = d_1 + r * d_2
e_3 = e_1 + r * e_2
f_3 = f_1 + r * f_2

E_3 = (
    k_1 * a_3 * b_3 * c_3 + u_3 * k_2 * d_3 * e_3 + u_3 ^ 2 * k_3 * f_3 + u_3 ^ 3 * k_4
)

T = (E_3 - E_1 - r ^ 3 * E_2) / r
show(T.expand())

# degree 4
E_1 = (
    k_1 * a_1 * b_1 * c_1 * d_1 + u_1 * k_2 * e_1 * f_1 * g_1 + u_1
    ^ 2 * k_3 * h_1 * i_1 + u_1
    ^ 3 * k_4 * j_1 + u_1
    ^ 4 * k_5
)

E_2 = (
    k_1 * a_2 * b_2 * c_2 * d_2 + u_2 * k_2 * e_2 * f_2 * g_2 + u_2
    ^ 2 * k_3 * h_2 * i_2 + u_2
    ^ 3 * k_4 * j_2 + u_2
    ^ 4 * k_5
)

g_3 = g_1 + r * g_2
h_3 = h_1 + r * h_2
i_3 = i_1 + r * i_2
j_3 = j_1 + r * j_2

E_3 = (
    k_1 * a_3 * b_3 * c_3 * d_3 + u_3 * k_2 * e_3 * f_3 * g_3 + u_3
    ^ 2 * k_3 * h_3 * i_3 + u_3
    ^ 3 * k_4 * j_3 + u_3
    ^ 4 * k_5
)

T = (E_3 - E_1 - r ^ 4 * E_2) / r
show(T.expand())

# jellyfish
print("jellyfish")

q_o = var("q_o")
pub_input = var("pub_input")
q_c = var("q_c")
q_mul0 = var("q_mul0")
q_mul1 = var("q_mul1")
q_lc0 = var("q_lc0")
q_lc1 = var("q_lc1")
q_lc2 = var("q_lc2")
q_lc3 = var("q_lc3")
q_hash0 = var("q_hash0")
q_hash1 = var("q_hash1")
q_hash2 = var("q_hash2")
q_hash3 = var("q_hash3")
q_ecc = var("q_ecc")

w_01 = var("w_01")
w_02 = var("w_02")
w_03 = var("w_03")

w_11 = var("w_11")
w_12 = var("w_12")
w_13 = var("w_13")

w_21 = var("w_21")
w_22 = var("w_22")
w_23 = var("w_23")

w_31 = var("w_31")
w_32 = var("w_32")
w_33 = var("w_33")

w_o1 = var("w_o1")
w_o2 = var("w_o2")
w_o3 = var("w_o3")

u_1 = var("u_1")
u_2 = var("u_2")
u_3 = var("u_3")

r = var("r")

E_1 = (
    q_ecc * w_01 * w_11 * w_21 * w_31 * w_o1 + u_1
    ^ 3 * q_mul0 * w_01 * w_11 + u_1
    ^ 3 * q_mul1 * w_21 * w_31 + u_1
    ^ 4 * q_lc0 * w_01 + u_1
    ^ 4 * q_lc1 * w_11 + u_1
    ^ 4 * q_lc2 * w_21 + u_1
    ^ 4 * q_lc3 * w_31 + q_hash0 * w_01
    ^ 5 + q_hash1 * w_11
    ^ 5 + q_hash2 * w_21
    ^ 5 + q_hash3 * w_31
    ^ 5 + u_1
    ^ 5 * q_c + u_1
    ^ 5 * pub_input - u_1
    ^ 4 * q_o * w_o1
)

E_2 = (
    q_ecc * w_02 * w_12 * w_22 * w_32 * w_o2 + u_2
    ^ 3 * q_mul0 * w_02 * w_12 + u_2
    ^ 3 * q_mul1 * w_22 * w_32 + u_2
    ^ 4 * q_lc0 * w_02 + u_2
    ^ 4 * q_lc1 * w_12 + u_2
    ^ 4 * q_lc2 * w_22 + u_2
    ^ 4 * q_lc3 * w_32 + q_hash0 * w_02
    ^ 5 + q_hash1 * w_12
    ^ 5 + q_hash2 * w_22
    ^ 5 + q_hash3 * w_32
    ^ 5 + u_2
    ^ 5 * q_c + u_2
    ^ 5 * pub_input - u_2
    ^ 4 * q_o * w_o2
)

w_03 = w_01 + r * w_02
w_13 = w_11 + r * w_12
w_23 = w_21 + r * w_22
w_33 = w_31 + r * w_32
w_o3 = w_o1 + r * w_o2
u_3 = u_1 + r * u_2

E_3 = (
    q_ecc * w_03 * w_13 * w_23 * w_33 * w_o3 + u_3
    ^ 3 * q_mul0 * w_03 * w_13 + u_3
    ^ 3 * q_mul1 * w_23 * w_33 + u_3
    ^ 4 * q_lc0 * w_03 + u_3
    ^ 4 * q_lc1 * w_13 + u_3
    ^ 4 * q_lc2 * w_23 + u_3
    ^ 4 * q_lc3 * w_33 + q_hash0 * w_03
    ^ 5 + q_hash1 * w_13
    ^ 5 + q_hash2 * w_23
    ^ 5 + q_hash3 * w_33
    ^ 5 + u_3
    ^ 5 * q_c + u_3
    ^ 5 * pub_input - u_3
    ^ 4 * q_o * w_o3
)

T = (E_3 - E_1 - r ^ 5 * E_2) / r

show(T.expand())
