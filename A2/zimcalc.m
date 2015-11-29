function s = zimcalc(x, y, tt, del0ratio)
% zimcalc(x, y, tt, delOratio)
% Computes the complex conductivity of a superconductor using
% the Zimmermann et al approach.
% Inputs: x = hbar*w/(2*delta), y=hbar/(2*delta*tau), tt=T/Tc
% where w is the angular frequency, delta is the gap, Tc is
% the critical temp and tau is the electron collision time. If
% the electron mean free path is le and vf is the Fermi velocity
% tau = le/vf. The coherence length xio = hbar*vf/(pi*delta0)
% so y can also be written y = (pi/2)*(xio/le)*(deltaO/delta).

deltratio = del0ratio*sqrt(l-tt)*(0.9963 + 0.7733*tt);
t = tt/(2*deltratio);
M = 250;
du = 1/M;
urange = 0.5*du:du:l;
sl = sum(zimintl(urange, x, y, t));
s2 = sum(zimint2(urange, x, y, t));
s = (sl*du + s2*du)*1i*y*0.5/x;