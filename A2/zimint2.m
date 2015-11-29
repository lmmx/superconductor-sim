function int2 = zimint2(u, x, y, t)
% zimint2(u, x, y, t)
% Zimmermann integral 2
e = 0.5 + (u./(1-u)).^2;
tiny = 1e-20;
small = 1e-3;
pl = sqrt((e+x).^2 - 0.25);
p2 = sqrt(e.^2 - .25);
c12 = (.25 + e.*(e+x))./(p1.*p2 + tiny);
cy = 1i*y;
th1 = tanh((e+x)/(2*t + small));
th2 = tanh(e/(2*t + small));
int2 = 2*(th1.*((1+c12)./(p1-p2+cy) - (1-c12)./(-p1-p2+cy)) + th2.*((1-c12)./(p1+p2+cy) - (1+c12)./(p1-p2+cy))).*u./(1-u).^3;