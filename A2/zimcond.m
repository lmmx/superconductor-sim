function s = zimcond(w, T, sup)
% zimcond(w, T, sup)
% Computes the complex conductivity ratio of a
% superconductor sup at angular frequency w and
% temperature T using the Zimmermann method.
% Get required superconductor characteristics
Tc = sup.Tc;
del0ratio = sup.delOratio;
xi0 = sup.xi0;
l = sup.l;

kb = 1.3806503e-23; % Boltzmann constant
hbar = 1.054571628e-34; % reduced Planck constant

del0 = del0ratio*kb*Tc;
delt = gap_supcond(T/Tc)*del0; % temperature corrected delta
k = del0/delt;

if (w > (2*delt/hbar))
fprintf('Warning: w too large in function zimcond\n');
end

s = conj(zimcalc((hbar*w/2/delt), (pi/2)*(xi0/l)*k, T/Tc, del0ratio));