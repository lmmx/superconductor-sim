function intl = zimint1(u, x, y, t)
% zimintl(u, x, y, t)
% Zimmermann integral 1
e = 0.5 + x*u.*u.*(3-2*u);
tiny = 1e-20;
small = 1e-3;
p4 = 1i*sqrt(0.25 - (e-x).^2);
p2 = sqrt(e.^2 - 0.25);
c42 = (0.25 + e.*(e-x))./(p4.*p2 + tiny);
cy = 1i*y;
th = tanh(e/(2*t + small));
intl = 6*x*th.*((1-c42)./(p4+p2+cy) - (1+c42)./(p4-p2+cy)).*u.*(1-u);