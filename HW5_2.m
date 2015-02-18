% Joel Lubinitsky - 02/18/15
% MAE 321 - HW 5.2

clear all
close all
clc

%% Problem 2:
% Consider the inverted pendulum of figure 1.40 in the book. Assume that
% one dashpot (of damping rate c) is installed in-line with the two
% springs. How does this affect the stability properties of the pendulum?
% Your answer should include any additional restrictions on the system
% parameters to ensure stability.
%
% <<MAE321Fig1_40.PNG>>
%
% Find: Stability of system, Requirements for stability

%% Calculations
% Sum of moments around pivot
%
% $$ ml^2\ddot{\theta} = -[\frac{kl^2}{2} \sin{\theta} + \frac{cl^2}{4} \sin{\dot{\theta}}] \cos{\theta} + mgl
% \sin{\theta} $$
%
% $$ ml^2\ddot{\theta} + [\frac{kl^2}{2} \sin{\theta} + \frac{cl^2}{4} \sin{\dot{\theta}}] \cos{\theta} - mgl
% \sin{\theta} = 0 $$
%
% With small angle approximation,
%
% $$ ml^2\ddot{\theta} + \frac{cl^2}{4} \dot{\theta} + \frac{kl^2}{2} \theta - mgl \theta = 0 $$




