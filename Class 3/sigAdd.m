%%
clc
clear all
close all

%%
f1 = @(n) n.*(n>=0);
f2 = @(n) n>=0;

%%
indx1 = -10:20;
indx2 = -25:10;

indx = min(min(indx1),min(indx2)):max(max(indx1),max(indx2));
sig1 = zeros(size(indx));
sig2 = zeros(size(indx));

sig1(indx>=-10 & indx<=20) = f1(indx1);
sig2(indx>=-25 & indx<=10) = f2(indx2);

sigAd = sig1 .* sig2;

subplot(311), stem(indx, sig1), axis tight;
subplot(312), stem(indx, sig2), axis tight;
subplot(313), stem(indx, sigAd), axis tight;