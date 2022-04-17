from sage.schemes.elliptic_curves.weierstrass_morphism import *
S.<a,b,c,d,e,n>=QQ[]
S=S.fraction_field()


var('t')

## Let M and D be functions in the variable t. The code below outputs the limit as t-> infinity of log(M)/log(|D|)
def MSRlp(M,D):
	return limit(log(abs(M),10)/log(abs(D),10),t=infinity).numerical_approx()

## Let M and D be functions in the variable t. The code below outputs the limit as t-> -infinity of log(M)/log(|D|)
def MSRln(M,D):
	return limit(log(abs(M),10)/log(abs(D),10),t=-infinity).numerical_approx()

## Let E be an elliptic curve with invariants c_4, c_6, and \Delta. The following code outputs for a given integer u, the triple [c4/u^4,c6/u^6,\Delta/u^12]

def Signature(E,u):
	return [factor(E.c4()/u^4),factor(E.c6()/u^6),factor(E.discriminant()/u^12)]

# Models for the family of elliptic curves E_T. We use the following naming convention:
#    E_{C_N}  is EN
#    E_{C_2 \times C_{N}}  is E2N

def E1(n):
    return EllipticCurve(S,[0,0,1,3*n+1,0])
def E2(a,b,d):
	A=a
	B=b^2*d
	return EllipticCurve(S,[0,2*A,0,A^2-B,0])
def E3(a,b):
    return EllipticCurve(S,[a,0,a^2*b,0,0])
def E30(a,b): # This is E_{C_3^0}
    return EllipticCurve(S,[0,0,a,0,0])
def E4(a,b):
    return EllipticCurve(S,[a,-a*b,-a^2*b,0,0])
def E5(a,b):
    return EllipticCurve(S,[a-b,-a*b,-a^2*b,0,0])
def E6(a,b):
    return EllipticCurve(S,[a - b, -a*b - b^2, -a^2*b - a*b^2, 0, 0])
def E7(a,b):
    return EllipticCurve(S,[a^2 + a*b - b^2, a^2*b^2 - a*b^3, a^4*b^2 - a^3*b^3, 0, 0])
def E8(a,b):
    return EllipticCurve(S,[-a^2 + 4*a*b - 2*b^2, -a^2*b^2 + 3*a*b^3 - 2*b^4, -a^3*b^3 + 3*a^2*b^4 - 2*a*b^5, 0, 0])
def E9(a,b):
    return EllipticCurve(S,[a^3 + a*b^2 - b^3, a^4*b^2 - 2*a^3*b^3 + 2*a^2*b^4 - a*b^5, a^7*b^2 - 2*a^6*b^3 + 2*a^5*b^4 - a^4*b^5, 0, 0])
def E10(a,b):
    return EllipticCurve(S,[a^3 - 2*a^2*b - 2*a*b^2 + 2*b^3, -a^3*b^3 + 3*a^2*b^4 - 2*a*b^5, -a^6*b^3 + 6*a^5*b^4 - 12*a^4*b^5 + 9*a^3*b^6 - 2*a^2*b^7, 0, 0])
def E12(a,b):
    return EllipticCurve(S,[-a^4 + 2*a^3*b + 2*a^2*b^2 - 8*a*b^3 + 6*b^4, a^7*b - 9*a^6*b^2 + 36*a^5*b^3 - 83*a^4*b^4 + 119*a^3*b^5 - 106*a^2*b^6 + 54*a*b^7 - 12*b^8, -a^11*b + 12*a^10*b^2 - 66*a^9*b^3 + 219*a^8*b^4 - 485*a^7*b^5 + 748*a^6*b^6 - 812*a^5*b^7 + 611*a^4*b^8 - 304*a^3*b^9 + 90*a^2*b^10 - 12*a*b^11, 0, 0])
def E22(a,b,d):
	A=a*d
	B=b*d
	return EllipticCurve(S,[0,A+B,0,A*B,0])
def E24(a,b):
    return EllipticCurve(S,[a, -a*b - 4*b^2, -a^2*b - 4*a*b^2, 0, 0])
def E26(a,b):
    return EllipticCurve(S,[-19*a^2+2*a*b+b^2, -10*a^4+22*a^3*b-14*a^2*b^2+2*a*b^3, 90*a^6-198*a^5*b+116*a^4*b^2+4*a^3*b^3-14*a^2*b^4+2*a*b^5, 0, 0])
def E28(a,b):
    return EllipticCurve(S,[-a^4 - 8*a^3*b - 24*a^2*b^2 + 64*b^4,-4*a^6*b^2 - 56*a^5*b^3 - 320*a^4*b^4 - 960*a^3*b^5 - 1536*a^2*b^6 - 1024*a*b^7,8*a^9*b^3 + 144*a^8*b^4 + 1024*a^7*b^5 + 3328*a^6*b^6 + 2048*a^5*b^7 - 21504*a^4*b^8 - 77824*a^3*b^9 - 114688*a^2*b^10 - 65536*a*b^11,0, 0])

# Definition for \alpha_T. We use the following naming convention:
#    \alpha_{C_N}  is alpN
#    \alpha_{C_2 \times C_{N}}  is alp2N

alp2(a,b,d)=(16) * (3*b^2*d + a^2)
alp3(c,d,e,b)=(-1) * (-(c^3*d^2*e) + 24*b) * (c^3*d^2*e)^3
alp4(c,d,b)=(c^2*d)^2 * ((c^2*d)^2 + 16*(c^2*d)*b + 16*b^2)
alp5(a,b)=a^4 + 12*a^3*b + 14*a^2*b^2 - 12*a*b^3 + b^4
alp6(a,b)=(a + 3*b) * (a^3 + 9*a^2*b + 3*a*b^2 + 3*b^3)
alp7(a,b)=(a^2 - a*b + b^2) * (a^6 + 5*a^5*b - 10*a^4*b^2 - 15*a^3*b^3 + 30*a^2*b^4 - 11*a*b^5 + b^6)
alp8(a,b)=a^8 - 16*a^7*b + 96*a^6*b^2 - 288*a^5*b^3 + 480*a^4*b^4 - 448*a^3*b^5 + 224*a^2*b^6 - 64*a*b^7 + 16*b^8
alp9(a,b)=(a^3 - 3*a*b^2 + b^3) * (a^9 - 9*a^7*b^2 + 27*a^6*b^3 - 45*a^5*b^4 + 54*a^4*b^5 - 48*a^3*b^6 + 27*a^2*b^7 - 9*a*b^8 + b^9)
alp10(a,b)=a^12 - 8*a^11*b + 16*a^10*b^2 + 40*a^9*b^3 - 240*a^8*b^4 + 432*a^7*b^5 - 256*a^6*b^6 - 288*a^5*b^7 + 720*a^4*b^8 - 720*a^3*b^9 + 416*a^2*b^10 - 128*a*b^11 + 16*b^12
alp12(a,b)=(a^4 - 6*a^3*b + 12*a^2*b^2 - 12*a*b^3 + 6*b^4) * (a^12 - 18*a^11*b + 144*a^10*b^2 - 684*a^9*b^3 + 2154*a^8*b^4 - 4728*a^7*b^5 + 7368*a^6*b^6 - 8112*a^5*b^7 + 6132*a^4*b^8 - 3000*a^3*b^9 + 864*a^2*b^10 - 144*a*b^11 + 24*b^12)
alp22(a,b,d)=(16) * d^2 * (a^2 - a*b + b^2)
alp24(a,b)=a^4 + 16*a^3*b + 80*a^2*b^2 + 128*a*b^3 + 256*b^4
alp26(a,b)=(21*a^2 - 6*a*b + b^2) * (6861*a^6 - 2178*a^5*b - 825*a^4*b^2 + 180*a^3*b^3 + 75*a^2*b^4 - 18*a*b^5 + b^6)
alp28(a,b)=a^16 + 32*a^15*b + 448*a^14*b^2 + 3584*a^13*b^3 + 17664*a^12*b^4 + 51200*a^11*b^5 + 51200*a^10*b^6 - 237568*a^9*b^7 - 1183744*a^8*b^8 - 1900544*a^7*b^9 + 3276800*a^6*b^10 + 26214400*a^5*b^11 + 72351744*a^4*b^12 + 117440512*a^3*b^13 + 117440512*a^2*b^14 + 67108864*a*b^15 + 16777216*b^16

# Definition for \beta_T. We use the following naming convention:
#    \beta_{C_N}  is betN
#    \beta_{C_2 \times C_{N}}  is bet2N

bet2(a,b,d)=(-64) * a * (9*b^2*d - a^2)
bet3(c,d,e,b)=(-1) * (c^3*d^2*e)^4 * ((c^3*d^2*e)^2 - 36*(c^3*d^2*e)*b + 216*b^2)
bet4(c,d,b)=((c^2*d) + 8*b) * (c^2*d)^3 * (-(c^2*d)^2 - 16*(c^2*d)*b + 8*b^2)
bet5(a,b)=(-1) * (a^2 + b^2) * (a^4 + 18*a^3*b + 74*a^2*b^2 - 18*a*b^3 + b^4)
bet6(a,b)=(-1) * (a^2 + 6*a*b - 3*b^2) * (a^4 + 12*a^3*b + 30*a^2*b^2 + 36*a*b^3 + 9*b^4)
bet7(a,b)=(-1) * (a^12 + 6*a^11*b - 15*a^10*b^2 - 46*a^9*b^3 + 174*a^8*b^4 - 222*a^7*b^5 + 273*a^6*b^6 - 486*a^5*b^7 + 570*a^4*b^8 - 354*a^3*b^9 + 117*a^2*b^10 - 18*a*b^11 + b^12)
bet8(a,b)=(-1) * (a^4 - 8*a^3*b + 16*a^2*b^2 - 16*a*b^3 + 8*b^4) * (a^8 - 16*a^7*b + 96*a^6*b^2 - 288*a^5*b^3 + 456*a^4*b^4 - 352*a^3*b^5 + 80*a^2*b^6 + 32*a*b^7 - 8*b^8)
bet9(a,b)=(-1) * (a^18 - 18*a^16*b^2 + 42*a^15*b^3 + 27*a^14*b^4 - 306*a^13*b^5 + 735*a^12*b^6 - 1080*a^11*b^7 + 1359*a^10*b^8 - 2032*a^9*b^9 + 3240*a^8*b^10 - 4230*a^7*b^11 + 4128*a^6*b^12 - 2970*a^5*b^13 + 1557*a^4*b^14 - 570*a^3*b^15 + 135*a^2*b^16 - 18*a*b^17 + b^18)
bet10(a,b)=(-1) * (a^2 - 2*a*b + 2*b^2) * (a^4 - 2*a^3*b + 2*b^4) * (a^4 - 2*a^3*b - 6*a^2*b^2 + 12*a*b^3 - 4*b^4) * (a^8 - 6*a^7*b + 4*a^6*b^2 + 48*a^5*b^3 - 146*a^4*b^4 + 176*a^3*b^5 - 104*a^2*b^6 + 32*a*b^7 - 4*b^8)
bet12(a,b)=(-1) * (a^8 - 12*a^7*b + 60*a^6*b^2 - 168*a^5*b^3 + 288*a^4*b^4 - 312*a^3*b^5 + 216*a^2*b^6 - 96*a*b^7 + 24*b^8) * (a^16 - 24*a^15*b + 264*a^14*b^2 - 1776*a^13*b^3 + 8208*a^12*b^4 - 27696*a^11*b^5 + 70632*a^10*b^6 - 138720*a^9*b^7 + 211296*a^8*b^8 - 248688*a^7*b^9 + 222552*a^6*b^10 - 146304*a^5*b^11 + 65880*a^4*b^12 - 17136*a^3*b^13 + 1008*a^2*b^14 + 576*a*b^15 - 72*b^16)
bet22(a,b,d)=(-32) * (a - 2*b) * (a + b) * (2*a - b) * d^3
bet24(a,b)=(-1) * (a^2 + 8*a*b - 16*b^2) * (a^2 + 8*a*b + 8*b^2) * (a^2 + 8*a*b + 32*b^2)
bet26(a,b)=(-1) * (183*a^4 - 36*a^3*b - 30*a^2*b^2 + 12*a*b^3 - b^4) * (393*a^4 - 156*a^3*b + 30*a^2*b^2 - 12*a*b^3 + b^4) * (759*a^4 - 228*a^3*b - 30*a^2*b^2 + 12*a*b^3 - b^4)
bet28(a,b)=(-1) * (a^8 + 16*a^7*b + 96*a^6*b^2 + 256*a^5*b^3 - 256*a^4*b^4 - 4096*a^3*b^5 - 12288*a^2*b^6 - 16384*a*b^7 - 8192*b^8) * (a^8 + 16*a^7*b + 96*a^6*b^2 + 256*a^5*b^3 + 128*a^4*b^4 - 1024*a^3*b^5 - 3072*a^2*b^6 - 4096*a*b^7 - 2048*b^8) * (a^8 + 16*a^7*b + 96*a^6*b^2 + 256*a^5*b^3 + 512*a^4*b^4 + 2048*a^3*b^5 + 6144*a^2*b^6 + 8192*a*b^7 + 4096*b^8)


# Definition for \gamma_T. We use the following naming convention:
#    \gamma_{C_N}  is gamN
#    \gamma_{C_2 \times C_{N}}  is gam2N

gam2(a,b,d)=(64) * d * b^2 * (b^2*d - a^2)^2
gam3(c,d,e,b)=(-1) * (-c^3*d^2*e + 27*b) * b^3 * (c^3*d^2*e)^8
gam4(c,d,b)=((c^2*d) + 16*b) * b^4 * (c^2*d)^7
gam5(a,b)=(-1) * b^5 * a^5 * (a^2 + 11*a*b - b^2)
gam6(a,b)=(a + 9*b) * a^2 * (a + b)^3 * b^6
gam7(a,b)=(-1) * b^7 * a^7 * (a - b)^7 * (a^3 + 5*a^2*b - 8*a*b^2 + b^3)
gam8(a,b)=a^2 * (a - 2*b)^4 * b^8 * (a - b)^8 * (a^2 - 8*a*b + 8*b^2)
gam9(a,b)=(-1) * b^9 * a^9 * (a - b)^9 * (a^2 - a*b + b^2)^3 * (a^3 + 3*a^2*b - 6*a*b^2 + b^3)
gam10(a,b)=a^5 * (a - 2*b)^5 * b^10 * (a - b)^10 * (a^2 + 2*a*b - 4*b^2) * (a^2 - 3*a*b + b^2)^2
gam12(a,b)=a^2 * (a - 2*b)^6 * b^12 * (a - b)^12 * (a^2 - 6*a*b + 6*b^2) * (a^2 - 2*a*b + 2*b^2)^3 * (a^2 - 3*a*b + 3*b^2)^4
gam22(a,b,d)=(16) * b^2 * a^2 * (a - b)^2 * d^6
gam24(a,b)=a^2 * (a + 8*b)^2 * b^4 * (a + 4*b)^4
gam26(a,b)=(64) * (-9*a + b)^2 * (-3*a + b)^2 * (3*a + b)^2 * (-5*a + b)^6 * (-a + b)^6 * a^6
gam28(a,b)=(256) * b^8 * a^8 * (a + 2*b)^8 * (a + 4*b)^8 * (a^2 - 8*b^2)^2 * (a^2 + 8*a*b + 8*b^2)^2 * (a^2 + 4*a*b + 8*b^2)^4

# Definition for \delta_{T}. We use the following naming convention:
#    \delta_{C_N}  is deltaN
#    \delta_{C_2 \times C_{N}}  is delta2N

delta2(a,b,d)=b^2*d*(b^2*d-a^2)
delta3(c,d,e,b)=3*b*d^2*e^4*(c^3*d^2*e-27*b)
delta4(c,d,b)=b*c*d^3*(16*b+c^2*d)
delta5(a,b)= b * a * (a^2 + 11*a*b - b^2)
delta6(a,b)=(a + 9*b) * a * (a + b) * b
delta7(a,b)=b* a* (a - b) * (a^3 + 5*a^2*b - 8*a*b^2 + b^3)
delta8(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 - 8*a*b + 8*b^2)
delta9(a,b)=b * a * (a - b) * (a^2 - a*b + b^2) * (a^3 + 3*a^2*b - 6*a*b^2 + b^3)
delta10(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 + 2*a*b - 4*b^2) * (a^2 - 3*a*b + b^2)
delta12(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 - 6*a*b + 6*b^2) * (a^2 - 2*a*b + 2*b^2) * (a^2 - 3*a*b + 3*b^2)
delta22(a,b,d)=b * a * (a - b) * d^3
delta24(a,b)=a * (a + 8*b) * b * (a + 4*b)
delta26(a,b)=(9*a - b) * (3*a - b) * (3*a + b) * (5*a - b) * (a - b) * a
delta28(a,b)=b* a * (a + 2*b) * (a + 4*b) * (a^2 - 8*b^2) * (a^2 + 8*a*b + 8*b^2) * (a^2 + 4*a*b + 8*b^2)


# Definition for \delta_{T,u_T}. We use the following naming convention:
#    \delta_{C_N,u_{C_N}}  is deltaN_uT
#    \delta_{C_2 \times C_{N},u_{C_2 \times C_{N}}}  is delta2N_uT

delta2_1(a,b,d)=2^8*b^2*d*(b^2*d-a^2)
delta2_2(a,b,d)=4*b^2*d*(b^2*d-a^2)
delta2_4(a,b,d)=1/64*b^2*d*(b^2*d-a^2)
delta3_c2d(c,d,e,b)=3*b*d^2*e^4*(c^3*d^2*e-27*b)
delta4_c(c,d,b)=2*b*c*d^3*(16*b+c^2*d)
delta4_2c(c,d,b)=1/16*b*c*d^3*(16*b+c^2*d)
delta5_1(a,b)= b * a * (a^2 + 11*a*b - b^2)
delta6_1(a,b)=(a + 9*b) * a * (a + b) * b
delta6_2(a,b)=1/8*(a + 9*b) * a * (a + b) * b
delta7_1(a,b)=b* a* (a - b) * (a^3 + 5*a^2*b - 8*a*b^2 + b^3)
delta8_1(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 - 8*a*b + 8*b^2)
delta8_2(a,b)=1/8*a * (a - 2*b) * b * (a - b) * (a^2 - 8*a*b + 8*b^2)
delta9_1(a,b)=b * a * (a - b) * (a^2 - a*b + b^2) * (a^3 + 3*a^2*b - 6*a*b^2 + b^3)
delta10_1(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 + 2*a*b - 4*b^2) * (a^2 - 3*a*b + b^2)
delta10_2(a,b)=1/4*a * (a - 2*b) * b * (a - b) * (a^2 + 2*a*b - 4*b^2) * (a^2 - 3*a*b + b^2)
delta12_1(a,b)=a * (a - 2*b) * b * (a - b) * (a^2 - 6*a*b + 6*b^2) * (a^2 - 2*a*b + 2*b^2) * (a^2 - 3*a*b + 3*b^2)
delta12_2(a,b)=1/8*a * (a - 2*b) * b * (a - b) * (a^2 - 6*a*b + 6*b^2) * (a^2 - 2*a*b + 2*b^2) * (a^2 - 3*a*b + 3*b^2)
delta22_1(a,b,d)=2^6*b * a * (a - b) * d^3
delta22_2(a,b,d)=b * a * (a - b) * d^3
delta24_1(a,b)=8*a * (a + 8*b) * b * (a + 4*b)
delta24_2(a,b)=1/2*a * (a + 8*b) * b * (a + 4*b)
delta24_4(a,b)=1/32*a * (a + 8*b) * b * (a + 4*b)
delta26_1(a,b)=(9*a - b) * (3*a - b) * (3*a + b) * (5*a - b) * (a - b) * a
delta26_4(a,b)=1/8*(9*a - b) * (3*a - b) * (3*a + b) * (5*a - b) * (a - b) * a
delta26_16(a,b)=1/512*(9*a - b) * (3*a - b) * (3*a + b) * (5*a - b) * (a - b) * a
delta28_1(a,b)=2*b* a * (a + 2*b) * (a + 4*b) * (a^2 - 8*b^2) * (a^2 + 8*a*b + 8*b^2) * (a^2 + 4*a*b + 8*b^2)
delta28_16(a,b)=1/128*b* a * (a + 2*b) * (a + 4*b) * (a^2 - 8*b^2) * (a^2 + 8*a*b + 8*b^2) * (a^2 + 4*a*b + 8*b^2)
delta28_64(a,b)=1/4096*b* a * (a + 2*b) * (a + 4*b) * (a^2 - 8*b^2) * (a^2 + 8*a*b + 8*b^2) * (a^2 + 4*a*b + 8*b^2)

# The quantities m_T and n_T defined in Lemma 3.1
# m_{C_N} (resp. l_{C_N}) is mN (resp. nN)
# m_{C_2 \times C_{N}} (resp. l_{C_2 \times C_{N}}) is m2N (resp. n2N)

m2=6
m3=12
m4=12
m5=12
m6=12
m7=24
m8=24
m9=36
m10=36
m12=48
m22=6
m24=12
m26=24
m28=48
l2=1.5
l3=2
l4=2.4
l5=3
l6=3
l7=4
l8=4
l9=4.5
l10=4.5
l12=4.8
l22=2
l24=3
l26=4
l28=4.8


# Definition for \A_T. We use the following naming convention:
#    \A_{C_N}  is AN
#    \A_{C_2 \times C_{N}}  is A2N
A2(n)=-1
A3(n)=1
A4(n)=256*n^2
A5(n)=2*n+1
A6(n)=3*n+1
A7(n)=3*n+1
A8(n)=4*n+1
A9(n)=2*n+1
A10(n)=4*n+1
A12(n)=6*n+1
A22(n)=16*n
A24(n)=2*n+1
A26(n)=8*n+3
A28(n)=4*n

# Definition for \B_T. We use the following naming convention:
#    \B_{C_N}  is BN
#    \B_{C_2 \times C_{N}}  is B2N
B2(n)=8
B3(n)=n
B4(n)=4*n^2-1
B5(n)=n
B6(n)=n
B7(n)=n
B8(n)=n
B9(n)=n
B10(n)=n
B12(n)=n
B22(n)=4*n+1
B24(n)=n
B26(n)=-1
B28(n)=n+1


# Definition for \D_T. We use the following naming convention:
#    \D_{C_N}  is DN
#    \D_{C_2 \times C_{N}}  is D2N
D2(n)=n
D22(n)=1

# Models Fm_T for the family of elliptic curves which have invariants equal to those of the minimal model of F_T. We note that this model may not be given by a minimal Weierstrass model. That said, from the proof of Theorem 4.3, its discriminant is equal to the minimal discriminant of F_T. We use the following naming convention:
#    Fm_{C_N}  is FmN
#    Fm_{C_2 \times C_{N}}  is Fm2N

def Fm1(n):
    return EllipticCurve(S.fraction_field(),[0,0,1,3*n+1,0])
def Fm2(n):
	return E2(A2(n),B2(n),D2(n)).change_weierstrass_model(2)
def Fm3(n):
    return E3(A3(n),B3(n))
def Fm4(n):
    return E4(A4(n),B4(n)).change_weierstrass_model(32*n)
def Fm5(n):
    return E5(A5(n),B5(n))
def Fm6(n):
    return E6(A6(n),B6(n))
def Fm7(n):
    return E7(A7(n),B7(n))
def Fm8(n):
    return E8(A8(n),B8(n))
def Fm9(n):
    return E9(A9(n),B9(n))
def Fm10(n):
    return E10(A10(n),B10(n))
def Fm12(n):
    return E12(A12(n),B12(n))
def Fm22(n):
	return E22(A22(n),B22(n),D22(n)).change_weierstrass_model(2)
def Fm24(n):
    return E24(A24(n),B24(n))
def Fm26(n):
    return E26(A26(n),B26(n)).change_weierstrass_model(16)
def Fm28(n):
    return E28(A28(n),B28(n)).change_weierstrass_model(64)

# Below we define c_{4,T}, c_{6,T}, and \mathcal{D}_{T} as given in the proof of Theorem 4.3. We use the following naming convention:
#    c_{4,C_N}, c_{6,C_N}, \mathcal{D}_{C_N}  is c4_N, c6_N, calD_N, respectively,
#    c_{4,C_2 \times C_N}, c_{6,C_2 \times C_N}, \mathcal{D}_{C_2 \times C_N}  is c4_2N, c6_2N, calD_2N, respectively,

c4_1(n) = S(Fm1(n).c4())
c6_1(n) = S(Fm1(n).c6())
calD_1(n) = S(Fm1(n).discriminant())
c4_2(n) = S(Fm2(n).c4())
c6_2(n) = S(Fm2(n).c6())
calD_2(n) = S(Fm2(n).discriminant())
c4_3(n) = S(Fm3(n).c4())
c6_3(n) = S(Fm3(n).c6())
calD_3(n) = S(Fm3(n).discriminant())
c4_4(n) = S(Fm4(n).c4())
c6_4(n) = S(Fm4(n).c6())
calD_4(n) = S(Fm4(n).discriminant())
c4_5(n) = S(Fm5(n).c4())
c6_5(n) = S(Fm5(n).c6())
calD_5(n) = S(Fm5(n).discriminant())
c4_6(n) = S(Fm6(n).c4())
c6_6(n) = S(Fm6(n).c6())
calD_6(n) = S(Fm6(n).discriminant())
c4_7(n) = S(Fm7(n).c4())
c6_7(n) = S(Fm7(n).c6())
calD_7(n) = S(Fm7(n).discriminant())
c4_8(n) = S(Fm8(n).c4())
c6_8(n) = S(Fm8(n).c6())
calD_8(n) = S(Fm8(n).discriminant())
c4_9(n) = S(Fm9(n).c4())
c6_9(n) = S(Fm9(n).c6())
calD_9(n) = S(Fm9(n).discriminant())
c4_10(n) = S(Fm10(n).c4())
c6_10(n) = S(Fm10(n).c6())
calD_10(n) = S(Fm10(n).discriminant())
c4_12(n) = S(Fm12(n).c4())
c6_12(n) = S(Fm12(n).c6())
calD_12(n) = S(Fm12(n).discriminant())
c4_22(n) = S(Fm22(n).c4())
c6_22(n) = S(Fm22(n).c6())
calD_22(n) = S(Fm22(n).discriminant())
c4_24(n) = S(Fm24(n).c4())
c6_24(n) = S(Fm24(n).c6())
calD_24(n) = S(Fm24(n).discriminant())
c4_26(n) = S(Fm26(n).c4())
c6_26(n) = S(Fm26(n).c6())
calD_26(n) = S(Fm26(n).discriminant())
c4_28(n) = S(Fm28(n).c4())
c6_28(n) = S(Fm28(n).c6())
calD_28(n) = S(Fm28(n).discriminant())

# Below we define the quantity \mathfrak{h}_T defined in Table 3. We use the following naming convention:
#    \mathfrak{h}_{C_N}  is frakhN
#    \mathfrak{h}_{C_2 \times C_{N}}  is frakh2N

frakh1(n)=abs((144*n + 48)^3)
frakh2(n)=abs((192*n + 1)^3)
frakh3(n)=(216*n^2 - 36*n + 1)^2
frakh4(n)=abs((5136*n^4 - 264*n^2 + 1)^3)
frakh5(n)=(421*n^4 + 526*n^3 + 206*n^2 + 26*n + 1)^2*(5*n^2 + 4*n + 1)^2
frakh6(n)=abs((120*n^3 + 84*n^2 + 18*n + 1)^3*(6*n + 1)^3)
frakh7(n)=(577801*n^12 + 2519622*n^11 + 4989285*n^10 + 5920782*n^9 + 4680102*n^8 + 2590434*n^7 + 1027173*n^6 + 293286*n^5 + 59682*n^4 + 8414*n^3 + 777*n^2 + 42*n + 1)^2
frakh8(n)=(2696*n^8 + 5984*n^7 + 5424*n^6 + 2272*n^5 + 184*n^4 - 224*n^3 - 96*n^2 - 16*n - 1)^2*(56*n^4 + 16*n^3 - 16*n^2 - 8*n - 1)^2
frakh9(n)=(22329*n^18 + 242514*n^17 + 1250883*n^16 + 4061502*n^15 + 9272961*n^14 + 15760494*n^13 + 20613420*n^12 + 21173562*n^11 + 17291556*n^10 + 11299356*n^9 + 5916807*n^8 + 2474496*n^7 + 819423*n^6 + 211626*n^5 + 41607*n^4 + 5994*n^3 + 594*n^2 + 36*n + 1)^2
frakh10(n)=abs((635920*n^12 + 2733440*n^11 + 5299680*n^10 + 6129200*n^9 + 4710480*n^8 + 2534880*n^7 + 979520*n^6 + 273840*n^5 + 54960*n^4 + 7720*n^3 + 720*n^2 + 40*n + 1)^3)
frakh12(n)=abs((42787896*n^12 + 129338064*n^11 + 173452752*n^10 + 137824296*n^9 + 72709428*n^8 + 26936592*n^7 + 7205496*n^6 + 1405032*n^5 + 198498*n^4 + 19836*n^3 + 1332*n^2 + 54*n + 1)^3*(366*n^4 + 348*n^3 + 120*n^2 + 18*n + 1)^3)
frakh22(n)=abs((208*n^2 - 8*n + 1)^3)
frakh24(n)=abs((976*n^4 + 672*n^3 + 200*n^2 + 24*n + 1)^3)
frakh26(n)=abs((439104*n^6 + 1005408*n^5 + 958080*n^4 + 486360*n^3 + 138720*n^2 + 21078*n + 1333)^3*(84*n^2 + 66*n + 13)^3)
frakh28(n)=abs((51361*n^16 + 180064*n^15 + 301720*n^14 + 511840*n^13 + 1140780*n^12 + 2129632*n^11 + 2812328*n^10 + 2658400*n^9 + 1853894*n^8 + 973088*n^7 + 387560*n^6 + 116768*n^5 + 26220*n^4 + 4256*n^3 + 472*n^2 + 32*n + 1)^3)


# Below we define the quantity \mathfrak{f}_T defined in Table 3. We use the following naming convention:
#    \mathfrak{f}_{C_N}  is frakfN
#    \mathfrak{f}_{C_2 \times C_{N}}  is frakf2N

frakf1(n)=(144*n^2 + 60*n + 13)*(12*n + 7)
frakf2(n)=(64*n - 1)*n
frakf3(n)=(27*n - 1)*n
frakf4(n)=(20*n^2 - 1)*(2*n + 1)*(2*n - 1)*n
frakf5(n)=(25*n^2 + 15*n + 1)*(2*n + 1)*n
frakf6(n)=(12*n + 1)*(4*n + 1)*(3*n + 1)*n
frakf7(n)=(49*n^3 + 49*n^2 + 14*n + 1)*(3*n + 1)*(2*n + 1)*n
frakf8(n)=(8*n^2 - 1)*(4*n + 1)*(3*n + 1)*(2*n + 1)*n
frakf9(n)=(9*n^3 + 18*n^2 + 9*n + 1)*(3*n^2 + 3*n + 1)*(2*n + 1)*(n + 1)*n
frakf10(n)=(20*n^2 + 10*n + 1)*(5*n^2 + 5*n + 1)*(4*n + 1)*(3*n + 1)*(2*n + 1)*n
frakf12(n)=(26*n^2 + 10*n + 1)*(21*n^2 + 9*n + 1)*(6*n^2 + 6*n + 1)*(6*n + 1)*(5*n + 1)*(4*n + 1)*n
frakf22(n)=(12*n - 1)*(4*n + 1)*n
frakf24(n)=(10*n + 1)*(6*n + 1)*(2*n + 1)*n
frakf26(n)=(18*n + 7)*(12*n + 5)*(8*n + 3)*(5*n + 2)*(3*n + 1)*(2*n + 1)
frakf28(n)=(7*n^2 + 6*n + 1)*(5*n^2 + 4*n + 1)*(n^2 - 2*n - 1)*(3*n + 1)*(2*n + 1)*(n + 1)*n


