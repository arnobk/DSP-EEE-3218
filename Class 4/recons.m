%%
clc
clear all
close all

%%
fs1 = 1e3;
fs2 = 200;
f = 150;
periodToObserve = 2;

%%
Ts1 = 1/fs1;
Ts2 = 1/fs2;
T = 1/f;

%%
timeInterVal1 = Ts1:Ts1:periodToObserve*T;
timeInterVal2 = periodToObserve*T+Ts2:Ts2:2*periodToObserve*T;
timeInterVal = [timeInterVal1 timeInterVal2];

sig = 2*sin(2*pi*f*timeInterVal + pi/12);

timeToInterp = Ts1:1e-6:2*periodToObserve*T;
sigRecons = interp1(timeInterVal, sig, timeToInterp, 'spline');

figure;
subplot(211), stem(sig), axis tight;
subplot(212), plot(timeToInterp, sigRecons), axis tight;