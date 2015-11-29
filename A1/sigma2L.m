function y = sigma2L(x, w, T, delt)
% sigma2L(x, w, T, delt)
% Integrand used to find the imaginary part of the complex conductivity
% E -> delt - hbarw + X^2 (to remove the square root singularity at the lowerb limit)
% new lower limit = 0; new upper limit = sqrt(hbarw)
hbarw = w*1.054571628e-34;
E = delt - hbarw + x.^2;
y = (2/hbarw)*(1 - 2*fermi(E + hbarw, T)).*(E.^2 + delt^2 + hbarw*E)./((sqrt(delt^2 - E.A2).*sqrt(2*delt + x.^2)));