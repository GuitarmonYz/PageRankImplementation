% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [eig_val, eig_vec, converge_indicator] = QR_iteration_with_shift(A, num_iter)
% solving eig_val problem using QR_iteration but with shift
[n, ~] = size(A);
eig_vec = eye(n);
[H, Q_h] = hessenberg_reduction(A);
norm(Q_h * H - A * Q_h);
converge_indicator = zeros(num_iter, 1);
for i = 1:num_iter
    mue = H(n, n);
    % qr - mue*I
    H(1:(n+1):n*n) = H(1:(n+1):n*n) - mue;
    [Q_g, R] = givens_qr(H);
    % rq + mue*I
    H = R * Q_g;
    H(1:(n+1):n*n) = H(1:(n+1):n*n) + mue;
    converge_indicator(i) = abs(H(2,1));
    eig_vec = Q_g * eig_vec;
end
eig_vec = Q_h * eig_vec;
eig_val = diag(H);
end

