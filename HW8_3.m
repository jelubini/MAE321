% Joel Lubinitsky
% MAE 321 - HW 8.3
% 03/18/15

clear all
close all
clc

%% Problem 3:
% Consider the simple model of a building subject to ground motion
% suggested in Figure P2.60. The building is modeled as a
% single-degree-of-freedom spring–mass system where the building mass is
% lumped atop two beams used to model the walls of the building in bending.
% Assume the ground motion is modeled as having amplitude of 0.1 m at a
% frequency of 7.5 rad/s. Approximate the building mass by 10^5 kg and the
% stiffness of each wall by 3.519 * 10^6   N/m. Compute the magnitude of
% the deflection of the top of the building.
%
% Find: X

%% Known
% $$ Y, \ \omega, \ m, \ k $$
amplitudeBase = 0.1;
frequencyForcing = 7.5;
mass             = 10 ^ 5;
stiffness        = 3.519 * 10 ^ 6;

%% Calculations
% $$ \omega_n = \sqrt{\frac{k_{eff}}{m}} $$
%
% $$ k_{eff} = 2k $$
%
% $$ r = \frac{\omega}{\omega_n} $$
%
% $$ X = Y \left[\frac{1+(2 \zeta r)^2}{(1-r^2)^2 + (2 \zeta
% r)^2}\right]^{1/2} $$
%
% Undamped System -> $$ \zeta = 0 $$
%
% $$ X = Y \left[\frac{1}{(1-r^2)^2}\right]^{1/2} $$
frequencyNatural = sqrt(2 * stiffness / mass);
ratioFrequency   = frequencyForcing / frequencyNatural;
amplitudeTop     = amplitudeBase * sqrt(1 / (1 - ratioFrequency ^ 2) ^ 2)

%% Results
% The magnitude of the deflection at the top of building with the given
% conditions is 0.4981 m.