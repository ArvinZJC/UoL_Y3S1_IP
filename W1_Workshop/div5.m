function [r] = div5(x)
% [r] = div5(x) - Ckeck to see if x is divisible by 5. If so, print the
% division result as output.

if rem(x, 5) ~= 0
    disp('x is NOT divisible by 5.');
    return
else
    r = x / 5;
end
end