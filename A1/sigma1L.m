function y = sigma1L(x, w, T, delt)
% sigmalL(x, w, T, delt)
% Integrand used to find the real part of the complex conductivity
% E -> delt + x^2 (to remove the square root singularity at the lower limit)
% new lower limit = 0; new upper limit = Inf
E = delt + x.^2;
hbarw = w*1.054571628e-34;
y = (4/hbarw)*(fermi(E, T) - fermi(E + hbarw, T)).*(E.^2 + delt^2 + hbarw*E)./(sqrt(2*delt + x.^2).*sqrt((E + hbarw).^2 - delt^2));