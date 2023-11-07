A = matrix([[1, 2], [3, 4]])

# what is the usage of det of matrix?
# https://en.wikipedia.org/wiki/Determinant
show(det(A))

A.det()
A.rref()
A.inverse()
A.echelon_form()

my_list = [2, "Grover", [3, 2, 1]]


A = matrix([[1, 2], [3, 4]])
# for i in range(5):
#     show(A ^ i)
#     show((A ^ i).det())

# show(list(range(3, 23, 3)))

# show([n^2 for n in [3..12]])

# 一次性画多个图
# plot([x^n for n in [2..6]],(x,0,1))

show(table([(i, det(A ^ i)) for i in [0, 4]]))


# 定义函数
def square_and_subtract(mymatrix):
    return mymatrix ^ 2 - mymatrix


# 删除关于 i 的定义/赋值
reset("i")
i
i ^ 2

# 定义稀疏矩阵
D = {(2, 3): 3, (4, 5): 6, (6, 0): -3}
C = matrix(D)
