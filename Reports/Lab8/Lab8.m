%% Lab 8 - Generate myPIDF.h
clear;
clc;
close all;

%% Sampling period

T = 0.005;                 % sec

%% T1a parameters (Table 7.2)

Ka = 0.06;                 % A/V
Km = 0.0698;               % N-m/A
J  = 7.8e-6;               % kg-m^2
B  = 0.0;                  % N-m-s/rad

%% Continuous-time position plant

num = Ka*Km;
den = [J B 0];

plant = tf(num,den);

disp('Plant:')
plant

%% PIDF design

wc = 2*pi*10;              % 10 Hz bandwidth

Options = pidtuneOptions( ...
    'DesignFocus', ...
    'reference-tracking');

Cp = pidtune( ...
    plant, ...
    'pidf', ...
    wc, ...
    Options);

disp('Continuous PIDF Controller:')
Cp

%% Closed-loop response check

CL = feedback(Cp*plant,1);

figure;
step(CL);
grid on;
title('Closed-Loop Position Step Response');

%% Bode check

figure;
margin(Cp*plant);
grid on;

%% Discretize controller

Cdp = c2d( ...
    Cp, ...
    T, ...
    'tustin');

disp('Discrete PIDF Controller:')
Cdp

%% Convert to transfer function

Cd = tf(Cdp);

[b,a] = tfdata(Cd,'v');

%% Convert into SOS (biquad form)

sos = tf2sos(b,a);

disp('SOS matrix:')
disp(sos)

%% Write myPIDF.h

fid = fopen('/Users/juliansoh/downloads/myPIDF.h','w');

sos2header( ...
    fid,...
    sos,...
    'PIDF',...
    T,...
    'PIDF position control');

fclose(fid);

disp(' ');
disp('myPIDF.h generated successfully')
