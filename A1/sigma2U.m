function y = sigma2U(x, w, T, delt)
% sigma2U(x, w, T, delt)
% Integrand used to find the imag part of the complex conductivity
% E -> delt - X^2 (to remove the square root singularity at the upper limit)
% new lower limit = 0; new upper limit = sqrt(hbarw)
E = delt - x.^2;
hbarw = w*1.054571628e-34;
y = (2/hbarw)*(l - 2*fermi(E + hbarw, T)).*(E.^2 + delt^2 + hbarw*E)./((sqrt(2*delt - x.^2).*sqrt((E + hbarw).^2 - delt^2)));