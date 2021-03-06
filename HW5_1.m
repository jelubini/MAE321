% Joel Lubinitsky - 02/18/15
% MAE 321 - HW 5.1

clear all
close all
clc

%% Problem 1:
% Use Lagrange�s formulation to calculate the equation of motion and the
% natural frequency of the system of Figure P1.76. Model each of the
% brackets as a spring of stiffness $$ k $$, and assume the inertia of the
% pulleys is negligible.
%
% <<MAE321Fig1_76.PNG>>
%
% Unknown: EoM, $$ \omega_n $$

%% Calculations
% Due to geometry of system, displacement of pulleys must be $$ \frac{1}{4}
% $$ the displacement of the mass. With this relation, total kinetic and
% potential energy are
%
% $$ T = \frac{1}{2}m\dot{x}^2 $$
%
% $$ U = \frac{1}{2}k\frac{x}{4}^2 \ + \ \frac{1}{2}k\frac{x}{4}^2 =
% \frac{1}{16}kx^2 $$
%
% $$ L = T - U = \frac{1}{2}m\dot{x}^2 - \frac{1}{16}kx^2 $$
%
% $$ \frac{d}{dt}(\frac{\partial L}{\partial \dot{x}}) - \frac{\partial
% L}{\partial x} = 0 $$
%
% $$ m\ddot{x} + \frac{1}{8}kx = 0 $$
%
% $$ \ddot{x} + \frac{k}{8m}x = 0 $$
%
% $$ \omega_n^2 $$ is the coefficient of the displacement, so
%
% $$ \omega_n = \sqrt{\frac{k}{8m}} $$