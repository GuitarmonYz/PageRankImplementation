% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16

function [Acopy, Q_prime] = practical_qr(A, max_iter)
%   PRATICAL QR: QR algorithm with shifts  
%   Formally, let A be a real matrix of which we want to 
%   compute the eigenvalues, and let A0:=A. 
%   At the k-th step (starting with k = 0), we compute the QR decomposition 
%   [Qk, Rk] = Ak where Qk is an orthogonal matrix (i.e., QT = Q?1) 
%   and Rk is an upper triangular matrix. We then form A_k+1 = RkQk.
%   Shifts are performed to speed up convergence rate.

Acopy = A;
[m, ~] = size(A);
Q_prime = eye(m);
for i=1:max_iter
    s = Acopy(m,m);
    [Q,R] = givens_qr(Acopy - s*eye(m));
    Acopy = R * Q + s*eye(m);
    Q_prime = mtimes(Q_prime, Q);
end
