%%
clc
clear all
close all

%%
f = [240 270 300 320 360 400 450 480];
    % sa re  ga  ma   pa dha ni  sa'
    
% f = [270 300 270 0 240 450 400 0 450 400 4000 0 0 400 450 270 300 320 300 0 ...
%      270 240 450 400 450];
fs = 2000;
Ts = 1/fs;
durationTolisten = .7; %in sec
bit = 12;
dataToPlay = [];

%%
for i = f
    t = Ts:Ts:durationTolisten;
    y = sin(2*pi*i*t);
    quantizedSig = quantize(y,[1 -1], bit);
    dataToPlay = [dataToPlay quantizedSig];
end

plyr = audioplayer(dataToPlay, fs);
play(plyr);

% try amaro porano jaha chay song   :p
% notes: re ga re || sa ni dha || ni dha dha
% dha ni || re ga || ma ga || re ga ma re ga || re sa ni dha ni