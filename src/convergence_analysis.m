% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
% analysis for convergence rate goes here
%% convergence rate analysis for Qr vs. Practical Qr using synthetic data
n = 4;
A = orth(abs(rand(n))); % get an othornormal basis
lambda = [30, 6, 2, 1]; % designed a known eignvalues
A = A * diag(lambda) * A'; % get synthetic data
num_iter = 10;
[~, ~, converge_no_shift] = QR_iteration(A, num_iter);
[~, ~, converge_with_shift] = QR_iteration_with_shift(A, num_iter);
plot(converge_no_shift);
hold on
plot(conver_with_shift);
hold off
%% convergence rate analysis for Power method vs. Arnoldi



%% convergence rate analysis for arnoldi
A = abs(rand(10));
[~, ~, converge_error] = arnoldi(A);
figure;
plot(converge_error);
