%%
clc
clear all
close all

%%
sig = @(f,t) sin(2*pi*f*t + pi/8);

%%
F = 100;
fs = 1150;
periodToObserve = 4;
bit = 4;

%%
T = 1/F;
Ts = 1/fs;

%%
timeInstant = Ts:Ts:periodToObserve*T;
sampledSig = sig(F, timeInstant);
quantizedSig = quantize(sampledSig, [1 -1], bit);

time = Ts:1e-6:periodToObserve*T;
originalSig = sig(F, time);

reconstructedSig = interp1(timeInstant, quantizedSig, time);

quantizationNoise = originalSig - reconstructedSig;

subplot(221), stem(sampledSig), grid on, axis tight, xlabel('sampled signal');
subplot(222), stem(quantizedSig), grid on, axis tight,...
    xlabel('sampled and quantized signal');
subplot(223), plot(time, originalSig, 'b'), hold on, ...
    plot(time, reconstructedSig, 'r'), axis tight, ...
    xlabel('original signal and reconstructed signal');
subplot(224), plot(time, quantizationNoise), axis tight, ...
    xlabel(sprintf('quantization noise %f', var(quantizationNoise)));