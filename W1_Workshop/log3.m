function [a] = log3(x)
% [a] = log3(x) - Calculate the base 3 logarithm of x.

a = log(abs(x)) ./ log(3);
end