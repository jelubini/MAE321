%Joel Lubinitsky
%MAE 321 - HW 2
%01/28/15

clear all
close all
clc

%% Given
mass             = 175;  %kg
stiffness        = 2500; %N/m
durationResponse = 2;    %s
xInitial         = 0;    %m
velocityInitial  = 10;   %mm/s

%% Conversions
velocityInitial = velocityInitial / 1000; %m/s

%% Calculations
time = [0:0.1:3];
x = (xInitial + (velocityInitial + sqrt(stiffness / mass) * xInitial) .* time) .* exp(-sqrt(stiffness / mass) .* time);

%% Plot
figure(1)
hold on
plot(time, x)
xlabel('Time, t [s]')
ylabel('Displacement, x(t) [m]')
title('Critical Response of Mass-Spring-Damper System')