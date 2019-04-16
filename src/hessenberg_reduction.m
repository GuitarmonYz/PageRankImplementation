function [H, Q] = hessenberg_reduction(A)
[n, ~] = size(A);
Q = eye(n);
H = A;
for i = 1 : n-2
    x = H(i+1:n, i);
    [Q_tmp, ~] = house_gen(x);
    H(i+1:n, i:n) = Q_tmp * H(i+1:n, i:n);
    H(i:n, i+1:n) = H(i:n, i+1:n) * Q_tmp;
    Q(i+1:n, 1:n) = Q_tmp * Q(i+1:n, 1:n);
end
end
