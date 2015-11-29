function Zx = filmZs(w, sn, d, sup)
% filmZs(w, sn, d, sup)
% Computes the surface impedance of a sup film of thickness
% d with normalized conductivity sn at angular frequency w.
% Includes the inductance correction for the two sheet model.

rho0 = sup.rhoo;

mu0=4*pi*1e-7; % magnetic constant
sigma0 = 1/rho0; % normal conductivity
Zn = 376.730313; % impedance of free space
c = 299792458; % speed of light in vacuum

s1 = sn*sigma0;
delta = sqrt(2/(mu0*w*s1));
lambda2 = (1 + 1i)/delta;
L = Zn*tan(w*d/c)/w;

% Compute the surface impedance - classical Zs from Matick pg 128
Zs = (lambda2/s1)*coth(lambda2*d);

% Correction using the inductance between two sheets = L
Zx = 0.5 *((2*Zs - 1i*w*L) + sqrt(4*Zs^2 +(1i*w*L)^2));