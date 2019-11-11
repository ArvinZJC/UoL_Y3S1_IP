function [r] = polyadd(poly1, poly2)
% [r] = polyadd(poly1, poly2) - Add 2 polynomials of not necessarily the
% same degree.

if length(poly1) < length(poly2)
    short = poly1;
    long = poly2;
else
    short = poly2;
    long = poly1;
end

lengthDiff = length(long) - length(short);

if lengthDiff > 0
    r = [zeros(1, lengthDiff), short] + long;
else
    r = long + short; % 2 polynomials of the same degree
end
end