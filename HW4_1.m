% Joel Lubinitsky - 02/11/15
% MAE 321 - HW 4.1

clear all
close all
clc

%% Problem 1:
% Consider the punch fixture of problem 1.82 in the book (and from the
% example we did in class on the handout). If the system is given an
% initial velocity of 15 m/s, what is the maximum displacement of the mass
% at the tip if the mass is 1200 kg and the bar is made of steel of length
% 0.25 m with a cross-sectional area of 0.01 $$ m^2 $$?
%
% Unknown: $$ x_{max} $$

%% Known
% $$ V_0, m, l, A, E_{steel} $$
vInitial         = 15;          % m/s
mass             = 1200;        % kg
lengthBar        = 0.25;        % m
areaCrossSection = 0.01;        % m^2
modulusSteel     = 2 * 10 ^ 11; % N/m^2

%% Calculations
% Rod with Axial Stiffness:
%
% $$ k = \frac{EA}{l} $$
%
% $$ \omega_n = \sqrt{\frac{k}{m}} $$
%
% $$ x(t) = x_0\cos{\omega_nt} + \frac{v_0}{\omega_n}\sin{\omega_nt} $$
%
% $$ x_0 = 0 $$, so $$ x(t) = \frac{v_0}{\omega_n}\sin{\omega_nt} $$
%
% Max when $$ \sin{\omega_nt} = 1 $$, so $$ x_{max} = \frac{v_0}{\omega_n} $$

stiffness = modulusSteel * areaCrossSection / lengthBar;
frequencyNatural = sqrt(stiffness / mass);
xMax = vInitial / frequencyNatural

%% Results
% Maximum displacement of the mass is 0.0058 m.