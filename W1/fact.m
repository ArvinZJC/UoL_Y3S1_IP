function [N] = fact(n)
% [N] = fact(n) - Calculate n factorial

if (n == 1) || (n == 0)
    N = 1;
else
    N = n * fact(n - 1);
end
end