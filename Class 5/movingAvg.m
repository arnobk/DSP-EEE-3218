%%
clc
clear all
close all

%%
f = 100;
fs = 2300;
periodToObserve = 8;
SNR = 10;
win = 10;

%%
Ts = 1/fs;
T = 1/f;
t = Ts:Ts:periodToObserve*T;

sig = sin(2*pi*f*t);

noiseAmp = sqrt(var(sig)/10^(SNR/10));
noisySig = sig + noiseAmp*randn(size(sig));

%%
len = length(noisySig);
denoisedSig = zeros(1,len);
y = zeros(1,win);

for i = 1:len
    y = [noisySig(i), y(1:end-1)];
    denoisedSig(i) = mean(y);
end

figure, subplot(311), plot(t,sig), axis tight;
subplot(312), plot(t,noisySig), axis tight;
subplot(313), plot(t,denoisedSig), axis tight;