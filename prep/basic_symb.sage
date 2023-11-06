
x = var("x")
z = (x+1)^3

# print(z.expand())
# print(z.factor())

z = ((x - 1)^(3/2) - (x + 1)*sqrt(x - 1))/sqrt((x - 1)*(x + 1))
# 化简表达式
# print(z.simplify_full())

# show(z.simplify_rational())

# = 表示赋值
# == 表示等式里面的等号
print(solve(x^2==-1,x))

# P=plot(f,(x,-1,1))
# 画图，指定表达式 1，自变量范围 -1，1；颜色，图形
# Q=plot(1,(x,-1,1),color="red", linestyle="--")
# P + Q 即可将图像画在一起
# (P+Q).show(xmin=-.1,xmax=.1,ymin=.99,ymax=1.01)
# plot(f,(x,-1,1),axes_labels=['$x$','$y$'],legend_label='$f(x)$',show_legend=True)
# P1 = plot(f,(x,-1,1),axes_labels=['$x$','$y$'],legend_label='$f(x)$')
# P2 = plot(sin,(x,-1,1),axes_labels=['$x$','$y$'],legend_label=r'$\sin(x)$',color='red')
# P1+P2

# 3d
# g(x,y)=sin(x^2+y^2)
# plot3d(g,(x,-5,5),(y,-5,5))

# plot3d(g,(x,-5,5),(y,-5,5),plot_points=300)

var('x,y')
b = 2.2
# P=plot3d(sin(x^2-y^2),(x,-b,b),(y,-b,b), opacity=.7)
# Q=plot3d(0, (x,-b,b), (y,-b,b), color='red')
# P+Q

var('x,y,z')
T = golden_ratio
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.78
# implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=50, color='yellow')

