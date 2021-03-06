% Joel Lubinitsky - 02/04/15
% MAE 321 - HW 3.3

clear all
close all
clc

%% Problem 4:
% Calculate the natural frequency and damping ratio for the system in
% Figure P1.91 given the values m = 10 kg, c = 100 kgs, k_1 = 4000 N/m,
% k_2 = 200 N/m, and k_3 = 1000 N/m. Assume that no friction acts on the
% rollers. Is the system overdamped, critically damped, or underdamped?
%
% Unknown: $$ \zeta $$

%% Known
mass = 10;
coefficientDamping = 100;
stiffness1 = 4000;
stiffness2 = 200;
stiffness3 = 1000;

%% Calculations
% $$ \zeta = \frac{c}{c_{cr}} $$
%
% $$ c_{cr} = 2\sqrt{k_{eff}m} $$
%
% $$ k_{eff} = k_1 + \frac{k_2k_3}{k_2+k_3} $$
%
% Therefore,
%
% $$ \zeta = \frac{c}{2\sqrt{k_1 + \frac{k_2k_3}{k_2+k_3}m}} $$

stiffnessEffective = stiffness1 + stiffness2 * stiffness3 / (stiffness2 + stiffness3);
coefficientDampingCritical = 2 * sqrt(stiffnessEffective * mass);
ratioDamping = coefficientDamping / coefficientDampingCritical

%% Results
% System is underdamped because $$ \zeta < 1 $$