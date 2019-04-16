function [eig_val, eig_vec] = QR_iteration_with_shift(A, num_iter)
[n, ~] = size(A);
eig_vec = eye(n);
[H, Q_h] = hessenberg_reduction(A);
norm(Q_h * H - A * Q_h);
for i = 1:num_iter
    mue = H(n, n);
    % qr - mue*I
    H(1:(n+1):n*n) = H(1:(n+1):n*n) - mue;
    [Q_g, R] = givens_qr(H);
    % rq + mue*I
    H = R * Q_g;
    H(1:(n+1):n*n) = H(1:(n+1):n*n) + mue;
    eig_vec = Q_g * eig_vec;
    if mod(i, 1000) == 0
        eig_vec_tmp = Q_h * eig_vec;
        norm(A * eig_vec_tmp - eig_vec_tmp * H)
    end
end
eig_vec = Q_h * eig_vec;
eig_val = H;
end

