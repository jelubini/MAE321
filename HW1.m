%Joel Lubinitsky
%MAE 321 - HW 1
%01/21/15

clear all
close all
clc

%% Given
frequencyNaturalRad = 3;       %rad/s
xInitial            = 1.2;     %mm
velocityInitial     = sqrt(3); %mm/s

%% Conversions
xInitial        = xInitial / 1000;        %m
velocityInitial = velocityInitial / 1000; %m/s

%% Calculations
frequencyNaturalHz = frequencyNaturalRad / (2 * pi); %Hz
periodNatural      = 1 / frequencyNaturalHz;         %s

dt        = 0.1;                    %s
timeTotal = 2 * periodNatural + dt; %s
time      = [0 : dt : timeTotal];   %s

x = xInitial .* cos(frequencyNaturalRad .* time) + (velocityInitial ./ frequencyNaturalRad) .* sin(frequencyNaturalRad .* time); %m

%% Plot
figure(1)
hold on
title('Time vs Displacement (Mass-Spring System)')
xlabel('Time, t [s]')
ylabel('Displacement, x(t) [m]')
plot(time, x)