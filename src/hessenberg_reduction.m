% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [H, Q] = hessenberg_reduction(A)
% convert a real matrix into a Hessenberg matrix
[n, ~] = size(A);
Q = eye(n);
H = A;
for i = 1 : n-2
    x = H(i+1:n, i);
    [Q_tmp, ~] = house_gen(x);
    H(i+1:n, i:n) = Q_tmp * H(i+1:n, i:n);
    H(1:n, i+1:n) = H(1:n, i+1:n) * Q_tmp;
    Q(i+1:n, 1:n) = Q_tmp * Q(i+1:n, 1:n);
end
end

