% Joel Lubinitsky
% MAE 321 - HW 8.1
% 03/18/15

clear all
close all
clc

%% Problem 1:
% A machine modeled as a linear spring-mass-damper system, is driven at
% resonance ($$ \omega_n = \omega = 2.5 \  rad/s $$). Design a damper
% (choose a value of c) so that the maximum deflection at steady state is
% 0.05 m. The machine is modeled as having a stiffness of 1700 N/m, and the
% excitation force has a magnitude of 150 N.
%
% Find: Design System, $$ c $$

%% Known
% $$ \omega_n, \ \omega, \ X, \ k, \ F_0 $$
frequencyNatural = 2.5;              % rad/s
frequencyDriving = frequencyNatural; % rad/s
amplitudeSS      = 0.05;             % m
stiffness        = 1700;             % N/m
forceDriving     = 150;              % N

%% Calculations
% $$ \omega_n = \sqrt{\frac{k}{m}} $$
%
% $$ m = \frac{k}{\omega_n^2} $$
%
% Steady State Amplitude:
%
% $$ X = \frac{f_0}{\sqrt{(\omega_n^2 - \omega^2) + (2\zeta \omega_n
% \omega)^2}} = \frac{f_0}{2 \zeta \omega^2} = \frac{f_0 \sqrt{km}}{c
% \omega^2} $$
%
% $$ c = \frac{f_0 \sqrt{km}}{X \omega^2} $$
mass                = stiffness / frequencyNatural ^ 2;
forceDrivingMassStd = forceDriving / mass;
coefficientDamping  = (forceDrivingMassStd * sqrt(stiffness * mass)) / ...
                      (amplitudeSS * frequencyDriving ^ 2)
                  
%% Results
% System can be designed using a damper with a damping coefficient $$ c =
% 1200 $$.