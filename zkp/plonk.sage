# new BN-254
p = 21888242871839275222246405745257275088696311157297823662689037894645226208583
Fp = GF(p)
a = Fp(0)
b = Fp(3)
E = EllipticCurve(Fp, [a, b])
Gx = Fp(1)
Gy = Fp(2)

show(E.order())
