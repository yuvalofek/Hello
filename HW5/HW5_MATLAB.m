%Yuval Epstain Ofek - MATLAB HW 5
clear;
close all;
clc;
%%

load fisheriris;

for n = 1:size(meas,1)
  cellarray(n) = Flower(meas(n,4), meas(n,3), meas(n,2), meas(n,1), strtrim(species{n}));
end

check = getSLength(cellarray(25));
bool = check == meas(25, 1);
report(cellarray(2))