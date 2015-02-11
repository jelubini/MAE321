% Joel Lubinitsky - 02/11/15
% MAE 321 - HW 4.4

clear all
close all
clc

%% Problem 4:
% Consider designing a helical spring such that when attached to a 10-kg
% mass, the result-ing spring–mass system has a natural frequency of
% 10 rad/s (about 1.6 Hz).
% (a) Design a similar steel spring, with the same restrictions on mass,
%     wire size, and coil diameter. This spring should result in a system
%     oscillation frequency of 7.5 rad/s.
% (b) Now design a similar spring made of aluminum instead. Keep the mass,
%     size, and system oscillation frequency restrictions as in the first
%     part of this problem.
% (c) Place a dashpot parallel to the original steel spring (from part (a)
%     here, not the original example in the book) and choose its
%     viscous-damping value so that the resulting damped natural frequency
%     is reduced to 6 rad/s.

%% Known
mass                   = 10;             % kg
modulusShearSt         = 8 * 10 ^ 10;    % N/m^2
modulusShearAl         = 2.67 * 10 ^ 10; % N/m^2
frequencyNatural       = 7.5;            % rad/s
frequencyNaturalDamped = 6;              % rad/s
nCoils                 = 13;
radiusCoil             = 0.1;            % m

%% Part A
% $$ \omega_n = \sqrt{\frac{k}{m}} $$
%
% $$ k = \frac{Gd^4}{64nR^3} $$
%
% $$ \frac{64m\omega_n^2 nR^3}{G} = d^4 $$
diameterWireSt = nthroot((64 * mass * frequencyNatural ^ 2 * nCoils * radiusCoil ^ 3) / modulusShearSt, 4)

%% Part B
diameterWireAl = nthroot((64 * mass * frequencyNatural ^ 2 * nCoils * radiusCoil ^ 3) / modulusShearAl, 4)

%% Part C
% $$ \omega_d = \omega_n \sqrt{1-\zeta^2} $$
%
% $$ \zeta = \frac{c}{c_{cr}} $$
%
% $$ c_{cr} = \sqrt{4km} $$
%
% $$ c = \sqrt{4km[1-(\frac{\omega_d}{\omega_n})^2]} $$
stiffnessSt = (modulusShearSt * diameterWireSt ^ 4) / (64 * nCoils * radiusCoil ^ 3);
coefficientDampingSt = sqrt(4 * stiffnessSt * mass * (1 - (frequencyNaturalDamped / frequencyNatural) ^ 2))

%% Results
% For Part (a), a helical steel spring with the given restrictions can be
% designed with a wire diameter $$ d = 0.0087 \ m $$.
%
% For Part (b), a similar aluminum spring can be designed with a wire
% diameter $$ d = 0.0115 \ m $$.
%
% For Part (c), the given system can be designed with a damper with
% coefficient $$ c = 90 \ kg/s $$.