%% clears all variables

clc
clear all
close all

%% define inline analog function to be sampled

sig = @(f,t) sin(2*pi*f*t + pi/10);

%% declares necessary variables
f = 25; %frequency of the sinusoid
periodToObserve = 6;

%% calculate the derived variables
T = 1/f;

%% main code

for fs = 10:10:100 % fs is the sampling frequency changing per iteration
    Ts = 1/fs; % Ts is the sampling interval
    timeInstant = Ts:Ts:periodToObserve*T;
    sampledSig = sig(f, timeInstant);
    subplot(5,2,fs/10);
    stem(sampledSig);
    xlabel(sprintf('f_s = %d',fs));
    axis tight
end