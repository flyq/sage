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
R.<x,y> = QQ[]
F = factor(x**99 + y**99)
print(F)
F.expand()