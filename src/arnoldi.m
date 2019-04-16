% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16

function [Q,H] = arnoldi(A,q1,m)
%   ARNOLDI    Arnoldi iteration
%   [Q,H] = ARNOLDI(A,q1,M) carries out M iterations of the
%   Arnoldi iteration with N-by-N matrix A and starting vector q1
%   (which is randomly generated).  For M < N it produces
%   an N-by-(M+1) matrix Q with orthonormal columns and an
%   (M+1)-by-M upper Hessenberg matrix H.

n = length(A);
if nargin < 3, m = n; end
q1 = q1/norm(q1);
Q = zeros(n,m); Q(:,1) = q1;
H = zeros(min(m+1,m),n);

for k=1:m
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
end
