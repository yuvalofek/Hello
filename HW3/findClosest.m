%%%Yuval Epstain Ofek HW3

function [val, ind] = findClosest(x, desiredValue)
%Function returns the value and index of a number in a vector / matrix that
%is closest to a desired value.
%   We first create a vector from the input, to bring it to one useable
%   form. After that we shift the sequence down by the desired value, so
%   that the index of the number closest to zero in "input will be the one
%   that is closest to the desired value in "x". After that we use abs and
%   min to find the min of the number closest to zero and thus the index of
%   the number closest to our desired value. 

input = abs(x(:) - desiredValue);
[~,ind] = min(input);
val = x(ind);
end

