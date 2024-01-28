"""
https://gist.github.com/HarryR/d3f099d588e91d05076f9c40ea331d9b
https://cryptosith.org/michael/data/talks/2013-08-01-SIAMAG13.pdf
https://www.issac-conference.org/2015/Slides/Schost.pdf
http://www.craigcostello.com.au/pairings/PairingsForBeginners.pdf
"""

fresh_compute = False	# Perform expensive-(ish) computations for curve orders

field_modulus = 22369874298875696930346742206501054934775599465297184582183496627646774052458024540232479018147881220178054575403841904557897715222633333372134756426301062487682326574958588001132586331462553235407484089304633076250782629492557320825577
desired_curve_order = 258664426012969094010652733694893533536393512754914660539884262666720468348340822774968888139573360124440321458177

# Find smallest extension field divisible by desired curve order
for pairing_degree in range(1, 12):
	if pairing_degree % 2 != 0:
		continue # must be even
	x = (field_modulus**pairing_degree)-1
	if x % desired_curve_order == 0:
		break
assert pairing_degree == 6

Fp = GF(field_modulus)

PARAM_A4 = Fp(5)
PARAM_A6 = Fp(17764315118651679038286329069295091506801468118146712649886336045535808055361274148466772191243305528312843236347777260247138934336850548243151534538734724191505953341403463040067571652261229308333392040104884438208594329793895206056414)

E = EllipticCurve(Fp, [PARAM_A4, PARAM_A6])

if fresh_compute:
	E_order = E.order()
else:
	E_order = 22369874298875696930346742206501054934775599465297184582183496627646774052458024540232479018147881220178054575403841904051432769089239847299357653499964436542832386963976320141304045324744586708834290383178262634904444967718221365125956

assert E_order % desired_curve_order == 0
E_cofactor = E_order // desired_curve_order
print '# E_order', E_order
print '# E_cofactor', E_cofactor

print('# E A4', Fp.vector_space()(E.a4()))
print('# E A6', Fp.vector_space()(E.a6()))

R.<T> = PolynomialRing(Fp)

assert field_modulus % 3 == 1


def find_non_residue(field, exponents):
	"""
	Find non-residue in the field
	Must not be residue from any of the exponents
	e.g. find_non_residue(Fp, [2,3])  # no quadratic or cubic residues
	"""
	g = field.gen()
	r = list()
	for e in exponents:
		r.append( (field.cardinality()-1)//e )
	for i in range(1, 2**10):
		nr = g+i
		failed = False
		for _ in r:
			if nr**_ == field(1):
				failed = True
				break
			if failed:
				break
		if failed:
			continue
		return nr

fp_non_residue = find_non_residue(Fp, [2,3])

Fp3.<u> = Fp.extension(T^3 - fp_non_residue)

E2 = EllipticCurve(Fp3, [E.a4() * (u**2), E.a6() * (u**3)])
print(E2)
print('# E2 A4', Fp3.vector_space()(E2.a4()))
print('# E2 A6', Fp3.vector_space()(E2.a6()))

if fresh_compute:
	E2_order = E2.order()
else:
	E2_order = 11194137345159537096108363490665619704866408361886658520558772227555313898508781311480310772226510689585105013245120673604104943368639255517300575713126164806947808685009483218431740622419222524615138240107289658328953869135610519931061989251823436202428776926763209857175055039116448322514546224758127644563663577550154707189585545390411353506556885650518703154241467658595998386258451604959736618578717583150572183233012032658357216865697896629844045997602806371916878894244189416741975219267657845954408270635162612245360200105264870609282025361472378746736609608505206566150870020810323134409611511279830225394508461850919774074946376247606256564162303420623676628965149799748634121758870575109568269200

assert (E2_order % desired_curve_order) == 0
E2_cofactor = E2_order // desired_curve_order
print('# E2 order', E2_order)



def find_generator(E, F, cofactor, order):
    for x in range(1, 10**3):
        x = F(x)
        y2 = x**3 + (E.a4()*x) + E.a6()
        if not y2.is_square():
            continue
        y = y2.sqrt()
        p = cofactor*E(x, y)
        if not p.is_zero() and (order*p).is_zero():
            # Choose the 'positive' point, where the Y coordinate is the lowest
            # This is an arbitrary choice... but allows for consistency across implementations
            negy = -p[1]
            if negy < p[1]:
                return -p
            return p


G1 = find_generator(E, Fp, E_cofactor, E_order)
G2 = find_generator(E2, Fp3, E2_cofactor, E2_order)

# See: http://www.craigcostello.com.au/pairings/PairingsForBeginners.pdf page 62

# Fp6 is quadratic over cubic, but can be constructed directly given the non-residue is neither quadratic nor cubic
Fp6.<v> = Fp.extension(T^6 - fp_non_residue)


# Allow projection of elements from Fp3 to Fp6
# See: http://doc.sagemath.org/html/en/reference/finite_rings/sage/rings/finite_rings/hom_finite_field.html
from sage.rings.finite_rings.hom_finite_field import FiniteFieldHomomorphism_generic
hom36 = FiniteFieldHomomorphism_generic(Hom(Fp3, Fp6))
hom63 = hom36.section()
# assert hom63(hom36(G2[0])) == G2[0]


# E2 is a twist of ET
ET = EllipticCurve(Fp6, [hom36(E2.a4()), hom36(E2.a6())])
GT = ET(hom36(G2[0]), hom36(G2[1]))
assert GT*desired_curve_order == ET(0)


def twist_E2_to_ET(p):
	return ET(hom36(p[0]), hom36(p[1]))


homp6 = FiniteFieldHomomorphism_generic(Hom(Fp, Fp6))
def map_E_to_ET(p):
	return (homp6(p[0]), homp6(p[1]))


"""
def line_function(A, B, P):
	# https://crypto.stanford.edu/pbc/notes/elliptic/tate.html
    if A==B:
        l = (3*A[0]^2)/(2*A[1])
    elif A == -B:
        return P[0]-A[0]
    else:
        l = (B[1]-A[1])/(B[0]-A[0])
    return l*(P[0]-A[0]) + A[1] - P[1]
"""

def line_function(P1, P2, T):
    """
    Create a function representing the line between P1 and P2, and evaluate it at T
    tangent if P1 == P2.
    vp3 = vertical line through P3 = P1 + P2
    """
    assert P1 and P2 and T  # No points-at-infinity allowed, sorry
    x1, y1 = P1[0], P1[1]
    x2, y2 = P2[0], P2[1]
    xt, yt = T[0], T[1]
    if x1 != x2:
        # Addition
        m = (y2 - y1) / (x2 - x1)
        return m * (xt - x1) - (yt - y1)
    elif y1 == y2:
        # Doubling
        m = 3 * x1**2 / (2 * y1)
        return m * (xt - x1) - (yt - y1)
    # P2 == -P1 or visa versa
    return xt - x1

def tate_miller_loop(P, Q, ds):
	R = Q
	f = Fp6.one()
	L = len(ds)
	for i in range(L-2, 0, -1):
		f = (f*f) * line_function(R, R, P)
		R = R+R
		if ds[i] == 1:
			f = f * line_function(R, Q, P)
			R = R + Q
	return f


def tate_miller_loop(P, Q, ate_loop_count):
	R = Q
	f = Fp6.one()
	log_ate_loop_count = floor(log(ate_loop_count, 2)) - 1
	for i in range(log_ate_loop_count, -1, -1):
		f = (f*f) * line_function(R, R, P)
		R = R+R
		if ate_loop_count & (2**i):         # addition step
			f = f * line_function(R, Q, P)
			R = R + Q
	return f


# XXX: broken!
def pairing(P, Q):
	"""Maps (G1 x G2) to a root of unity in Fp6"""
	ate_loop_count = 506464946133393486072777102926336625944849939610982267859828541006717966526573193706126370441346337661774335955699621
	ate_loop_bits = Integer(ate_loop_count).digits(2)
	assert ((ate_loop_count**6) - 1) % desired_curve_order == 0
	#final_exp = (Fp6.cardinality()-1)//desired_curve_order
	return tate_miller_loop(map_E_to_ET(P), twist_E2_to_ET(Q), ate_loop_bits)