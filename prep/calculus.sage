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

# 画切线
P=plot(f,(x,-1,1))
c=1/3
fprime=derivative(f,x)
L(x)=fprime(c)*(x-c)+f(c)
Q=plot(L,(x,-1,1), color="red", linestyle="--")
P+Q

# 动态切线
# 只能在 notebook 中运行
# f(x)=x^3+1
# @interact
# def _(c=(1/3,(-1,1))):
#     P=plot(f,(x,-1,1))
#     fprime=derivative(f,x)
#     L(x)=fprime(c)*(x-c)+f(c)
#     Q=plot(L,(x,-1,1),color="red", linestyle="--")
#     show(P+Q+point((c,f(c)), pointsize=40, color='red'),ymin=0,ymax=2)

# 求不定积分
show(integral(cos(x),x))
# sin(x)

# 求定积分
integral(cos(x),(x,0,pi/2))
# 1

h(x) = cos(x)
# 求复杂函数的定积分
# 1. 先不定积分 integral，然后赋值，
# 2. 直接定积分 numerical_integral，基于 GSL
numerical_integral(h,0,pi/8)
# (0.4031997191615114, 4.476416117355069e-15) error tolerance
# 3. 直接使用 nintergrate
h(x).nintegrate(x,0,pi/8)