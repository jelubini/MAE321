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
% will cancel out as we�ve seen in class (and to not include $$ \Delta $$
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

time = linspace(0, 5, 100);
% x    = 