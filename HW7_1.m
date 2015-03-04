% Joel Lubinitsky
% MAE 231 - HW7.1
% 03/04/15

clear all
close all
clc

%% Problem 1:
% An $$ 85 kg $$ mass is suspended by a spring of stiffness $$ 20 \times
% 10^3 \ N/m $$ with a viscous damping constant of $$ 1200 Ns/m $$. The
% mass is initially at rest and in equilibrium. Calculate the steady-state
% displacement amplitude and phase if the mass is excited by a harmonic
% force of $$ 75 N $$ at $$ 3 Hz $$.
%
% Find: $$ x, \phi $$

%% Known
% $$ m, \ k, \ c, \ F_0, \ f $$
mass                = 85;
stiffness           = 20 * 10 ^ 3;
constantDamping     = 1200;
xInitial            = 0;
vInitial            = 0;
forceHarmonic       = 75;
frequencyHarminicHz = 3;

%% Calculations
% $$ f_0 = \frac{F_0}{m} $$
%
% $$ \omega_n = \sqrt{\frac{k}{m}} $$
%
% $$ c_{cr} = \sqrt{4km} $$
%
% $$ \zeta = \frac{c}{c_{cr}} $$
%
%
% $$ \omega = 2 \pi f $$
%
% $$ X = \frac{f_0}{\sqrt{(\omega_n^2 - \omega^2)^2  + (2 \zeta \omega_n
% \omega)^2}} $$
%
% $$ \theta = \arctan{\frac{2 \zeta \omega_n \omega}{\omega_n^2 - \omega^2}}
% $$
