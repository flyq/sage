from sage.all import *

print(3 + 5)  # addition
print(57.1**100)  # exponentiation

A = matrix([[1, 2], [3, 4]])
B = A ** (-1)  # matrix inverse
# what the meaning of matrix inverse?
# https://www.mathsisfun.com/algebra/matrix-inverse.html
print(B)

# create a symbolic variable
x = var("x")

# Define a function
f = x**2 - 3 * x + 2
g = integrate(sqrt(x) * sqrt(1 + x), x)
print(g)


# Find the roots of the function
roots = solve(f, x)

# Print the roots
for root in roots:
    print(root.rhs())
