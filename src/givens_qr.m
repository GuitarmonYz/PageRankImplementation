function [Q,R] = givens_qr(H)
% assume input is a hessenberg matrix
[n, ~] = size(H);
R = H;
Q = eye(n);
for i = 1 : n-1
    [G,~] = planerot(R(i:i+1,i));
    R(i:i+1, i:n) = G * R(i:i+1, i:n);
    Q(i:i+1, 1:i+1) = G * Q(i:i+1, 1:i+1);
end
Q = Q';
