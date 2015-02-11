% Joel Lubinitsky - 02/11/15
% MAE 321 - HW 4.2

clear all
close all
clc

%% Problem 3:
% A pendulum decays from 12 cm to 2 cm over one period. Determine its
% damping ratio.
%
% Unknown: $$ \zeta $$

%% Known
% $$ x_1, \ x_2 $$
xPeak1 = 12; % cm
xPeak2 = 2;  % cm

%% Conversions
xPeak1 = xPeak1 / 100; % m
xPeak2 = xPeak2 / 100; % m

%% Calculations
% $$ \delta = \ln{\frac{x_1}{x_2}} $$
%
% $$ \zeta = \frac{\delta}{\sqrt{4\pi^2 + \delta^2}} $$
delta        = log(xPeak1 / xPeak2);
ratioDamping = delta / sqrt(4 * pi ^ 2 + delta ^ 2)

%% Results
% The given pendulum has a damping ratio $$ \ \zeta = 0.274 $$.