% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [Q,R] = givens_qr(H)
% QR decompocition of given hessenberg matrix using givens rotation
[n, ~] = size(H);
R = H;
Q = eye(n);
for i = 1 : n-1
    [G,~] = planerot(R(i:i+1,i));
    R(i:i+1, i:n) = G * R(i:i+1, i:n);
    Q(i:i+1, 1:i+1) = G * Q(i:i+1, 1:i+1);
end
Q = Q';
