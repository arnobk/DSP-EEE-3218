%%
clc
clear all
close all

%%
sig = @(n) 2*(n>=-1 & n<=2) + 4*(n>=3 & n<=5);

%%
indx = -20:20;
signl = sig(-indx);

stem(indx, signl), axis tight