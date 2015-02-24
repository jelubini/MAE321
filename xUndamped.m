% Joel Lubinitsky
% 02/22/15
% General Solution for Undamped Response

function x = xUndamped(xInitial, vInitial, frequencyNatural, time)

x = xInitial .* cos(frequencyNatural .* time)...
 + (vInitial ./ frequencyNatural) .* sin(frequencyNatural .* time);

end