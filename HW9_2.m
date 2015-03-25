% Joel Lubinitsky
% MAE 321 - HW9.2
% 03/25/15

clear all
close all
clc

%% Problem 2:
% The damping coefficient for a particular accelerometer of the type
% illustrated in figure 2.26 of the book is 45 N s/m. It is desired to
% accurately measure accelerations in a frequency range of 0 to 75 Hz with
% a maximum error of only 3%. Design the rest of the device (m and k) to
% achieve this.
%
% <<MAE321Fig2_26.PNG>>
%
% Find: $$ m, \ k $$

%% Known
% $$ c, \ f_m $$
coefficientDamping = 45;   % Ns/m
frequencyMaxHz     = 75;   % Hz
errorMax           = 0.03;

%% Calculations
% For max error of 3% @ r = 0.2:
%
% $$ 0.97 < \frac{1}{\sqrt{(1-r^2)^2 + (2 \zeta r)^2}} < 1.03 $$
%
% $$ 0.97 < \frac{1}{\sqrt{0.9216 + 0.16 \zeta^2}} < 1.03 $$
%
% $$ 0.867 + 0.15 \zeta^2 < 1 < 0.978 + 0.17 \zeta^2 $$
%
% $$ 0.36 < \zeta < 0.94 $$
%
% $$ \frac{c}{2 \sqrt{km}} = 0.5 \ -> \ km = c^2$$
%
% $$ r = \frac{\omega_m}{\omega_n} \ -> \ \frac{k}{m} =
% \left(\frac{\omega_n}{r}\right)^2 $$
%
% Solving simultaneous equations:
%
% $$ k = \frac{\omega_m}{r}c $$
%
% $$ m = \frac{c^2}{k} $$
frequencyMaxRad = frequencyMaxHz .* 2 .* pi;
ratioFrequency  = 0.2;
stiffness       = (frequencyMaxRad .* coefficientDamping) ./ ratioFrequency
mass            = (coefficientDamping .^ 2) ./ stiffness

%% Results
% The required system can be designed using a 0.0191 kg mass and a spring
% of stiffness 106030 N/m.