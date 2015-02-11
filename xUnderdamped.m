% Joel Lubinitsky
% 02/10/15
% General Solution for Underdamped Response

function x = xUnderdamped(xInitial, vInitial, ratioDamping, frequencyNatural, frequencyNaturalDamped, time)

% Constants Based on System Parameters
constantA   = sqrt(((vInitial + ratioDamping * frequencyNatural * xInitial) ^ 2 + (xInitial * frequencyNaturalDamped) ^ 2) / frequencyNaturalDamped ^ 2);
constantPhi = atan((xInitial * frequencyNaturalDamped) / (vInitial + ratioDamping * frequencyNatural * xInitial));

% General Solution of Response
x = constantA .* exp(-ratioDamping .* frequencyNatural .* time) .* sin(frequencyNaturalDamped .* time + constantPhi);
end