function [F] = eff(x)
% [F] = eff(x) - Describe the non-linear function f(x) = e ^ x - x ^ 2.

F = exp(x) - x .^ 2;
end