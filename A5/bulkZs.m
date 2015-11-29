function Zs = bulkZs(w, sigma, sup)
% bulkZs(w, sigma, sup)
% Computes the bulk surface impedance at angular
% frequency w for a material sup with normalized
% conductivity sigma.
rho0 = sup.rho0;

mu0 4*pi*le-7;
Zs = sqrt(1i*w*muO/(sigma/rho0));