%%
clc
clear all
close all

%%
indx = -10:30;
implse = indx == 0;
stp = indx >= 0;
ad = implse + stp;

y1 = zeros(size(indx));
y2 = zeros(size(indx));
y3 = zeros(size(indx));

y1(indx==-1) = -5;
y2(indx==-1) = -5;
y3(indx==-1) = -5;

for i = 0:indx(end)
    y1(indx == i) = .5*y1(indx == i-1) + implse(indx == i);
    y2(indx == i) = .5*y2(indx == i-1) + stp(indx == i);
    y3(indx == i) = .5*y3(indx == i-1) + ad(indx == i);
end

figure, subplot(211), stem(indx, y1+y2), axis tight
subplot(212), stem(indx, y3), axis tight
% % % % %%
% % % % b = [1];
% % % % a = [1 -.5 -1];
% % % % 
% % % % y = filter(b, a, impls);
% % % % 
% % % % figure, stem(indx,y), axis tight