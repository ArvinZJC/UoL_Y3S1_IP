function [x] = gaussel(A, b)
% [x] = gaussel(A, b)
%   This subroutine will perform Gaussian Elimination and back substituion
%   to solve the system Ax = b.
%   INPUT: A - matrix for the left hand side.
%          b - vector for the right hand side.
%   OUTPUT: x - the solution vector.

N = max(size(A));

% perform Gaussian Elimination
for j = 2 : N,
    for i = j : N,
        m = A(i, j - 1) / A(j - 1, j - 1);
        A(i, :) = A(i, :) - A(j - 1, :) * m;
        b(i) = b(i) - m * b(j - 1);
    end
end

% perform back substitution
x = zeros(N, 1);
x(N) = b(N) / A(N, N);

for j = N - 1 : -1 : 1,
    x(j) = (b(j) - A(j, j + 1 : N) * x(j + 1 : N)) / A(j, j);
end
end