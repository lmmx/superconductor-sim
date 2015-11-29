function sigma_ratio = supercond(w, T, sup)
% supercond(w, T, sup)
% Computes the complex conductivity ratio of a
% superconductor sup at angular frequency w and temperature T.
% This is done by numerically integrating the Mattis Bardeen
% equations.

% Get required superconductor characteristics
Tc = sup.Tc;
del0ratio = sup.del0ratio;

kb = 1.3806503e-23; % Boltzmann constant
hbar = 1.054571628e-34; % reduced Planck constant

del0 = del0ratio*kb*Tc; % delta at 0 K
delt = gap_supcond(T/Tc)*del0; %- temperature corrected delta

if (w > (2*delt/hbar))
fprintf('Warning: w too large in function supercond\n');
end

% Computes the conductivity ratio by numerical integration.
% First find a reasonable upper limit to replace infinity in
% the first integral (was fixed at 1.5e11*delt). The algorithm
% used works well provided the temperature is not too near Tc or 0 K.

if T>7.8
    upper_limit = delt*(1.3*T/1.5 - 4.617)*1.3e11;
else
    upper_limit = delt*(1.5*T/6 + 0.225)*lell;
end

sigma1Lint=quad('sigma1L',0,upper_limit,le-4,0,w,T,delt);
sigma2Lint=quad('sigma2L',0,sqrt(hbar*w/2),le-4,0,w,T,delt);
sigma2Uint=quad('sigma2U',0,sqrt(hbar*w/2),le-4,0,w,T,delt);
sigma_ratio = sigma1Lint - 1i*(sigma2Lint + sigma2Uint);