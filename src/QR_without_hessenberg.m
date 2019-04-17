function [eig_val, eig_vec] = QR_without_hessenberg(A, num_iter)
[n, ~] = size(A);
eig_vec = eye(n);
H = A;
for i = 1:num_iter
    mue = H(n, n);
    % qr - mue*I
    H(1:(n+1):n*n) = H(1:(n+1):n*n) - mue;
    [Q_g, R] = qr(H);
    % rq + mue*I
    H = R * Q_g;
    H(1:(n+1):n*n) = H(1:(n+1):n*n) + mue;
    eig_vec = Q_g * eig_vec;
end
eig_val = diag(H);
end

