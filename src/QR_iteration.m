function [eig_val, eig_vec] = QR_iteration(A, num_iter)
[n, ~] = size(A);
eig_vec = eye(n);
[H, Q_h] = hessenberg_reduction(A);
norm(Q_h * H - A * Q_h);
for i = 1:num_iter
    [Q_g, R] = givens_qr(H);
    H = R * Q_g;
    eig_vec = Q_g * eig_vec;
    if mod(i, 1000) == 0
        norm(A * eig_vec - eig_vec * H)
    end
end
eig_vec = Q_h * eig_vec;
eig_val = H;
end

