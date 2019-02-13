%%
clc
clear all
close all

%%
f = @(n) n.*(n>=0);

%%
indx = -15:27;
sig = f(indx);

indxNew = -fliplr(indx);
sigFlp = fliplr(sig);

stem(indxNew, sigFlp), axis tight