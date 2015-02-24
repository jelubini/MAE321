% Joel Lubinitsky
% MAE 231 - HW6.2
% 02/25/15

clear all
close all
clc

%% Problem 2:
% For the system sketched on the next page, use the Euler-Lagrange
% equations to derive the (single) equation of motion in terms of one
% general coordinate x. Feel free to ignore the static deflection that it
% will cancel out as we’ve seen in class (and to not include $$ \Delta $$
% in the expression of the spring potential when you do). Some helpful
% reminders:
%
% $$ \bullet $$ Due to the pulley, $$ \xi = \frac{x}{2} $$ and $$ x =
% 2R\theta $$
%
% $$ \bullet $$ In terms of polar moment of inertia, consider the pulley as
% a disk (What is J in terms of m and R?)
%
% For $$ m_1 = 1 kg, m = 2 kg, k = 2 N/m, k_1 = 5 N/m, R = 0.3 m, x_0 = 0.1
% m $$ and $$ v_0 = 0 $$, plot the response of this system. From the
% figure, estimate the natural frequency of the system. Separately,
% calculate $$ \omega_n $$ from the coefficients in the equation of motion.
% How do they compare?
%
% <<MAE321HW6_2.PNG>>
%
% Find: Response of system, $$ \omega_n $$ (Estimate/Calculate)

%% Known
% $$ m_1, m, k, k_1, R, x_0, v_0 $$
mass1      = 1;   % kg
mass       = 2;   % kg
stiffness  = 2;   % N/m
stiffness1 = 5;   % N/m
radius     = 0.3; % m
xInitial   = 0.1; % m
vInitial   = 0;   % m/s

%% Calculations
% $$ \xi = \frac{x}{2}, \ x = 2R\theta $$
%
% $$ T = \frac{1}{2}m_1\dot{x}^2  + \frac{1}{2}J\dot{\theta}^2 =
% \frac{1}{2}m_1\dot{x}^2 + \frac{1}{16}m\dot{x}^2 $$
%
% $$ U = \frac{1}{2}k\xi^2 + \frac{1}{2}k_1x^2 = \frac{1}{8}kx^2 +
% \frac{1}{2}k_1x^2 $$
%
% $$ L = T - U = \frac{1}{2}m_1\dot{x}^2 + \frac{1}{16}m\dot{x}^2 -
% \frac{1}{8}kx^2 - \frac{1}{2}k_1x^2 $$
%
% $$ \frac{d}{dt}(\frac{\partial L}{\partial \dot{x}}) - \frac{\partial
% L}{\partial x} = 0 $$
%
% $$ (\frac{1}{8}m + m_1)\ddot{x} + (\frac{1}{4}k + k_1)x = 0 $$
%
% $$ \ddot{x} + (\frac{\frac{1}{4}k + k_1}{\frac{1}{8}m + m_1})x = 0 $$
%
% $$ \omega_n = \sqrt{\frac{\frac{1}{4}k + k_1}{\frac{1}{8}m + m_1}} $$

frequencyNaturalEoM = sqrt((0.25 * stiffness + stiffness1) /...
                           (mass / 8 + mass1))
time                = linspace(0, 10, 1000);
x                   = xUndamped(xInitial, vInitial, frequencyNaturalEoM, time);
[peak1, indexPeak1] = max(x(200:400));
indexPeak1          = 199 + indexPeak1;
[peak2, indexPeak2] = max(x(500:700));
indexPeak2          = 499 + indexPeak2;
frequencyNaturalEst = (2 * pi) / (time(indexPeak2) - time(indexPeak1))


%% Plot
figure(1)
hold on
axis([0 10 -0.11 0.11])
title('Undamped Response of System')
xlabel('Time, t [s]')
ylabel('Displacement, x(t) [m]')
plot(time, x)
plot(time(indexPeak1), x(indexPeak1), 'o', 'color', [1 0 0])
plot(time(indexPeak2), x(indexPeak2), 'o', 'color', [1 0 0])

%% Results
% The natural frequency obtained from coefficients of the equation of
% motion is $$ \omega_n = 2.0976 \ rad/s $$ and the natural frequency estimated
% from the plot of the response is $$ \omega_n = 2.0993 \ rad/s $$. These numbers
% are very close, and theoretically should be the same. The difference in
% the values can be accounted for by error caused by a time step that is
% too large in the plot.
