% Find Q from S21 data.
% According to Petersan and Anlage, "Measurements of Resonant frequency
% and Quality Factor of Microwave Resonators: Comparison of Methods"
% (http://arxiv.org/pdf/cond-mat/9805365), a good way to find Q is to
% fit a Lorentzian curve to the measurement data. This program does
% that using Matlab's non-linear least squares fitting routines.
% Input should be an ASCII data file with frequency as the first column
% and measured power (in dB) in the second column. Frequency is assumed
% to be of order 1e9.
clear
close all
clc

% load measured data
S21 = load('S21.txt');
x = S21(:,l)/1e9; % scale frequency
measured = S21(:,2);
y = 10.^(measured/20);
plot(x,measured,'bo'); % shc
hold on;

% esti
[peak ipeak] = max(y); % gue
fres = x(ipeak); % gue
N = size(x);

% find approx half power ind
ihalf = 0;
for i = ipeak:N,
if (y(i) <= peak/sqrt(2))
ihalf = i;
break
end
i = i + 1;
end

Q = 1000;
if ihalf > 0
Q = fres/2/(x(ihalf) - fres);
end

p0 = [fres fres/Q peak 0.000001 0.1 0.0001]; % starting parameters

guess = lorentzmodel(p0, x); % show inital guess
plot(x,20*log10(guess),'r-');

% improve the guess by fitting

pl = nlinfit(x, y, @lorentzmodel, p0);
p2 = lsqcurvefit(@lorentz_model, p0, x, y);

% show fitted curves
y1 = lorentzmodel(pl, x);
plot(x,20*log1O(y1),'g.');
y2 = lorentzmodel(p2, x);
% plot(x,20*loglO(y2),'g-');
legend('Data', 'Fit');
xlabel('Frequency (GHz)');
ylabel('S21 (dB)');

el = sum((y-yl).^2);
e2 = sum((y-y2).^2);

fprintf('             Guessed: Peak = %f, Resonant freq = %f, Q = %f \n', peak, fres, Q);
fprintf('NLINFIT Estimated: Peak = %f, Resonant freq = %f, Q = %f (error = %.2e) \n', p1(3), p1(1), abs(p1(1)/pl(2)), el);
fprintf('NLINFIT Estimated: Peak = %f, Resonant freq = %f, Q = %f (error = %.2e) \n', p2(3), p2(1), abs(p2(1)/p2(2)), e2);