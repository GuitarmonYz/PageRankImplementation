% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [eig_val, eig_vec] = arnoldi_with_qr(A, ar_iter, qr_iter)
[Q,H] = arnoldi(A, ar_iter);
[H_prime, Q_prime] = practical_qr(H, qr_iter);
eig_vec = Q * Q_prime;
eig_val = diag(H_prime);
end

