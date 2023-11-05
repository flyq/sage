from sage.all import *

# 创建随机矩阵
m = random_matrix(RDF, 500)
# 计算特征值
# what's the meaning of eigenvalues?
# https://www.mathsisfun.com/algebra/eigenvalue.html
# 特征值是唯一的，但是特征向量不是唯一的
# A * (1,4) = 6 * (1,4)
# A * (2,8) = 6 * (2,8)
e = m.eigenvalues()
w = [(i, abs(e[i])) for i in range(len(e))]
# show(points(w))

#  GNU Multiprecision Library (GMP)
# factorial 阶乘
a = factorial(100)
n = factorial(1000000)
print(a)

# $\pi$ 的计算
N(pi, digits=100)
print(N(pi, digits=100))

# 分解多项式
R = PolynomialRing(QQ, "x,y")
x, y = R.gens()

for i in range(100):
    F = factor(x**i + y**i)
    # print(F)
    # expand 展开
    # print(F.expand())

# what is Partitions?
# https://en.wikipedia.org/wiki/Partition_(number_theory)
# 分治，将一个数分解为多个数的和
# what is cardinality?
# https://en.wikipedia.org/wiki/Cardinality
# 求集合的基数，即元素的个数
# z = Partitions(10**8).cardinality()
set = Partitions(10)
for i in set:
    print(i)
print(set.cardinality())

set_a = Set([1, 2, 33])
print(set_a.cardinality())
