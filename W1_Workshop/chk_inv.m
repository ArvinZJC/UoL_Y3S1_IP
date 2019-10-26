function [Ainv] = chk_inv(A)
% [Ainv] = chk_inv(A) - Calculate the inverse of a matrix A (if it exists).

[m, n] = size(A); % compute the size of the matrix A

if m ~= n % check if A is square
    disp('Matrix is not square.');
    return % quit the function
elseif det(A) == 0 % check if A is singular
    disp('Matrix is singular');
    return
else
    Ainv = inv(A); % compute the inverse
end
end