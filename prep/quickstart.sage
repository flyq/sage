# 四元组群
# G = QuaternionGroup()

# 置换群
# H = AlternatingGroup(5)

## number theory
# a^(n-1) = 1 (mod n)
a = mod(2, 11)
a ^ 10
a ^ 1000000

# 获取一个整数环
for a in Integers(11):
    print("{} {}".format(a, a ^ 10))

# 生成一个随机素数
p = random_prime(10 ^ 200, proof=True)
# 大素数的整数环
Zp = Integers(p)
show(Zp.random_element())

p = 13
# what is primitive root?
# https://en.wikipedia.org/wiki/Primitive_root_modulo_n
# 类似生成元
primitive_root(p)
# 分解成两个数的平方和
two_squares(p)
is_prime(p)

p = random_prime(10 ^ 20, 10 ^ 30)
q = mod(primitive_root(p), p)
show(q == primitive_root(p))
n = randint(1, p)
m = randint(1, p)
x = q ^ n
y = q ^ m
show(x ^ m == y ^ n)

prime_pi(100)
# plot(prime_pi, 1, 100)
var("x")


(
    plot(prime_pi, 2, 10 ^ 6, thickness=2)
    + plot(Li, 2, 10 ^ 6, color="red")
    + plot(x / ln(x), 2, 10 ^ 6, color="green")
)
