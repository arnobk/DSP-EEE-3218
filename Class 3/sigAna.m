%%
clc
clear all
close all

%%
f = @(n) (n>=0 & n<=3).*n + (n>=4 & n<=6).*(6-n);

%%
indx = -30:30;

sig = f(-indx-5 );
figure; stem(indx,sig);