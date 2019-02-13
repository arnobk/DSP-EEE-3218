function quantizedSig = quantize(sampledSig, valRange, bit)
%%
delta = (valRange(1)-valRange(2))/(2^bit-1);

%%
sampledSig = sampledSig - valRange(2);
level = floor(sampledSig/delta);
quantizedSig = level*delta + valRange(2);

end

