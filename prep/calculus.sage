f(x) = x^3 + 1

show(f)

# 求极限
lim(f, x=1)

# 求不同方向的极限
lim(f,x=1,dir='-'); 
lim(f,x=1,dir='right'); 
f(1)

# 求导数
# show(diff(f,x)); show(derivative(f,x)); show(f.derivative(x))

# 对 x^4 连续三次求导数
show(derivative(x^4, x, 3))

# P = plot(f, (x, 0,2))
# g(x) = 2*(x-1) + f(1)
# Q = plot(g, (0,2))
# P+Q

P=plot(f,(x,-1,1))
c=1/3
fprime=derivative(f,x)
L(x)=fprime(c)*(x-c)+f(c)
Q=plot(L,(x,-1,1), color="red", linestyle="--")
P+Q