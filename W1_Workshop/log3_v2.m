function [a] = log3_v2(x)
% [a] = log3_v2(x) - Calculate the base 3 logarithm of x (if applicable).

if x < 0
    disp("x should not be negative.");
    return
elseif x == 0
    disp("x should not be 0.");
    return
else
    a = log(x) ./ log(3);
end