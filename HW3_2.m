% Joel Lubinitsky - 02/04/15
% MAE 321 - HW 3.2

clear all
close all
clc

%% Problem 2:
% Springs are available in stiffness values of 10, 100, and 1000 N/m.
% Design a spring system using these values only, so that a 150 kg mass is
% connected to ground with an undamped natural frequency of about 1.5 rad/s.
%
% Unknown: Number/position of springs

%% Known
mass             = 150;  % kg
frequencyNatural = 1.5;  % rad/s
stiffness1       = 10;   % kg/s^2
stiffness2       = 100;  % kg/s^2
stiffness3       = 1000; % kg/s^2
stiffness        = [stiffness1 stiffness2 stiffness3];

%% Calculations
% $$ w_n = \sqrt{\frac{k}{m}} $$
%
% $$ k = mw_n ^ 2 $$
stiffnessTotal = mass * frequencyNatural ^ 2;

stiffness = sort(stiffness, 'descend');
nSpringsParallel = zeros(1, length(stiffness));
stiffnessRemaining = stiffnessTotal;
for k = stiffness
    
    if k > stiffnessRemaining
        continue
    end
    
    indexSpring = find(k == stiffness);
    nSpringsParallel(indexSpring) = floor(stiffnessRemaining / k);
    stiffnessRemaining = stiffnessRemaining - k * nSpringsParallel(indexSpring);
end

nSpringsSeries = zeros(1, length(stiffness));
[minSpring, indexSpring] = min(stiffness);
if stiffnessRemaining ~= 0
    for n = [1 : 1 : 10]
        nSpringsSeries(n, indexSpring) = ceil(minSpring / stiffnessRemaining);
        stiffnessRemaining = stiffnessRemaining - minSpring / nSpringsSeries(n, indexSpring);
        
        if stiffnessRemaining == 0
            break
        end
        
        nSpringsSeries = [nSpringsSeries; zeros(1, length(stiffness))];
    end
end

nSpringsParallel = [stiffness; nSpringsParallel]
nSpringsSeries = [stiffness; nSpringsSeries]

%% Results
% System with required behavior can be designed with 3 100 N/m and 3 10 N/m
% springs in parallel, with 2 10 N/m springs in series, and with 4 10 N/m
% springs in series.