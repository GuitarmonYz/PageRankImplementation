% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [Q,H, converge_error] = arnoldi(A, M)
%   ARNOLDI    Arnoldi iteration
%   [Q,H] = ARNOLDI(A) carries out size(A) iterations of the
%   Arnoldi iteration with N-by-N matrix A and starting vector q1
%   (which is randomly generated).
[n, ~] = size(A);
q1 = rand(n,1);
q1 = q1/norm(q1);
Q = zeros(n,n); Q(:,1) = q1;
H = zeros(n,n);
converge_error = zeros(n,1);
if M > n
    M = n;
end
for k=1:M
    z = A*Q(:,k);
    for i=1:k
        H(i,k) = Q(:,i)'*z;
        z = z - H(i,k)*Q(:,i);
    end
    if k < n
       H(k+1,k) = norm(z);
       if H(k+1,k) == 0, return, end
       Q(:,k+1) = z/H(k+1,k);
    end
%     converge_error(i) = norm(A * Q - Q * H);
    
end
end
