function [a] = rand_int(MIN, MAX)
% [a] = rand_int(MIN, MAX) - Generate a random integer between MIN (included) and MAX (not included).

a = MIN + floor((MAX - MIN) * rand(1));
end