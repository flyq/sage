from sage.all import *

# 加减乘除乘方等
print(3 + 5)
print(57.1**100)

# 矩阵相关
A = matrix([[1, 2], [3, 4]])
# what the meaning of matrix inverse?
# https://www.mathsisfun.com/algebra/matrix-inverse.html
B = A ** (-1)  # matrix inverse
print(B)

# 函数相关，创建符号变量
x = var("x")
# 不定积分
g = integrate(sqrt(x) * sqrt(1 + x), x)
print(g)

# 求解函数
f = x**2 - 3 * x + 2
roots = solve(f, x)
print(roots)

a = var("a")
S = solve(x**2 + x == a, x)
print(S)

# 绘图
# 可惜，这个绘图功能在这里无法使用，
# 但是本地启动 sage 之后，可以显示图片需要在本地安装sage
show(plot(sin(x) + sin(1.6 * x), 0, 40))
