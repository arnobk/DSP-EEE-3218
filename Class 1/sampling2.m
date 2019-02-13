%% clears all variables

clc
clear all
close all

%% define inline analog function to be sampled

sig = @(f,t) sin(2*pi*f*t + pi/10);

%% declares necessary variables
fs = 50; %frequency of the sinusoid
periodToObserve = 12;

%% calculate the derived variables
Ts = 1/fs; % Ts is the sampling interval

%% main code
figure(1);
figure(2);

for f = 10:10:200 % fs is the sampling frequency changing per iteration
    T = 1/f; % T is the analog signal period
    timeInstant = Ts:Ts:periodToObserve*T;
    
    sampledSig = sig(f, timeInstant);
    
    if f<110
        figure(1)
        subplot(5,2,f/10);
    else
        figure(2)
        subplot(5,2,f/10-10);
    end
    stem(sampledSig);
    xlabel(sprintf('f = %d',f));
    axis tight
end