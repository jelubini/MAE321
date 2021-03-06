% Joel Lubinitsky - 02/11/15
% MAE 321 - HW 4.2

clear all
close all
clc

%% Problem 2:
% The figure on the second page of this homework sheet shows the
% displacement of a vibrating spring-mass-damper. From the plot, determine
% the undamped natural frequency, the damping ratio, the damped natural
% frequency, the inital position, and the initial velocity. From these
% values, recreate the oscillation solution expression.
%
% Unknown: $$ \omega_n, \ \zeta, \ \omega_d, \ x_0, \ v_0 $$

%% Known
% <<HW4_2Plot.PNG>>

xPeak1 = 3;   % cm
xPeak2 = 0.8; % cm

tPeak1 = 0.3; % s
tPeak2 = 2.8; % s

xInitial = 2;   % cm
xStep    = 2.5; % cm

tInitial = 0;   % s
tStep    = 0.08; % s

%% Conversions
xPeak1 = xPeak1 / 100; % m
xPeak2 = xPeak2 / 100; % m

xInitial = xInitial / 100  % m
xStep    = xStep / 100;    % m

%% Calculations
% $$ \delta = \ln{\frac{x_1}{x_2}} $$
%
% $$ \zeta = \frac{\delta}{\sqrt{4\pi^2 + \delta^2}} $$
%
% $$ \omega_n = \frac{\delta}{\zeta T} $$
%
% $$ \omega_d = \frac{2\pi}{T} $$
%
% $$ v_0 = \frac{\Delta x}{\Delta t} $$
period                 = tPeak2 - tPeak1;
delta                  = log(xPeak1 / xPeak2);
ratioDamping           = delta / sqrt(4 * pi ^ 2 + delta ^ 2)
frequencyNatural       = delta / (ratioDamping * period)
frequencyNaturalDamped = (2 * pi) / period
vInitial               = (xStep - xInitial) / (tStep - tInitial)
time                   = [0 : 0.01 : 10];
x                      = xUnderdamped(xInitial, vInitial, ratioDamping, ...
                         frequencyNatural, frequencyNaturalDamped, time);

%% Plot
figure(1)
hold on
grid on
title('Measured Underdamped Response')
xlabel('Time, t [s]')
ylabel('Displacement, x(t) [m]')
plot(time, x, '-x')

%% Results
% The given system has an undamped natural frequency $$ \omega_n = 2.57 \ rad/s $$,
% damping ratio $$ \zeta = 0.206 $$, damped natural frequency $$ \omega_d =
% 2.51 \ rad/s $$, initial position $$ x_0 = 0.02 \ m $$, and initial velocity $$ v_0
% = 0.0625 \ m/s $$.