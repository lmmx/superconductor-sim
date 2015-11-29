function rho0 = rhonorm(Tc, delOratio, lambdaL, xi0, 1)
% rhonorm(Tc, del0ratio, lambdaL, xio, 1)
% Computes the normal resistivity (in ohm-m) of a superconductor
% based on its superconductivity parameters.

mu0=4*pi*1e-7; % magnetic constant
kb = 1.3806503e-23; % Boltzmann constant
hbar = 1.054571628e-34; % reduced Planck constant

del0 = del0ratio*kb*Tc;
rho0 = lambdaL^2*mu0*pi*del0*xi0/(l*hbar);