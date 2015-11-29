function gap = gapsupcond(x)
% gapsupcond(x)
% Calculates superconducting energy gap as a function of temp
% ratio x = T/Tc. (This function was taken from supermix.)
% Table of reduced energy gap vs. T/Tc, from Muhlschlegel (1959).
% Table starts at x = T/Tc 0.18, and goes in steps of dx = 0.02
ratio = [1.0, 0.9999, 0.9997, 0.9994,0.9989, 0.9982,0.9971,0.9957,0.9938,0.9915,0.9885,0.985,0.9809,0.976,0.9704,0.9641,0.9569,0.9488,0.9399,0.9299,0.919,0.907,0.8939,0.8796,0.864,0.8471,0.8288,0.8089,0.7874,0.764,0.7386,0.711,0.681,0.648,0.6117,0.5715,0.5263,0.4749,0.4148,0.3416,0.2436,0.0 ];
% check if x is physical
if (x < 0) 
    or (x >= 1)
gap = 0;
return
end

if (x < 0.04)
gap = 1;
    return
end

% if x <= 0.32, we use an analytic expression to extend the gap table;
% (which uses k Tc -= Delta(O)/1.764; c.f. Tinkham)

xmatch = 0.32; % xmatch must be a multiple of 0.02, >= 0.18
ymatch = exp(-sqrt((2*pi/1.764)*xmatch)*exp(-1.764/xmatch));

if (x <= xmatch)
gap = exp(-sqrt((2*pi/1.764)*x)*exp(-1.764/x));
    return
end

% if we get here, we interpolate between data points to calculate gap, taking
% sqrt(l - T/Tc) dependence near the gap into account.

index = floor((x-0.18)/0.02); % index into ratio table
x1 = index*0.02 + 0.18;
xu = x1 + 0.02;

if (x1 > xmatch)
y1 = ratio(index + 1)/sqrt(1-x1); % Changed to account for Matlab
%indexing
else
y1 = ymatch/sqrt(1-x1);
end
if (index < 40)
yu = ratio(index + 2)/sqrt(1-xu); % Changed to account for Matlab
indexing

else
yu = 1.74; % behavior near Tc - see Tinkham, eqn. 2-54.
end

gap = sqrt(1 - x) * (y1 + (yu-y1)*(x-x1)/(xu-x1)); % linear interp into ratio table