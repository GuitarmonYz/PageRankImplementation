% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [eVec, eVal, errorArr] = power_method(A, k)
%   powerMethod    Power Method
%   [eVec,eVal] = powerMethod(A) computes for the eigenvalues 
%   and eigenvectors of matrix A for k iterations or until the result
%   error is below the tolerance of 1*10^(-14).

[~, n] = size(A);

%normalize input sparse matrix
sumCol = sum(A, 2);
factor = zeros(n, 1);
for colNum = 1:n
    if sumCol(colNum) ~= 0
        factor(colNum) = 1/sumCol(colNum);
    else
        factor(colNum) = 0;
    end
end
A = A * diag(factor);

%tolerance
tol = 1*10^(-14);

%initialization
eVec = ones(n, 1);
error = inf;
nrm = 1;
i = 0;
errorArr = zeros(1, k);

%Power iterations
while error > tol && i <= k
    result = A * eVec;
    error = abs(norm(eVec) - nrm);
    nrm = norm(eVec);
    eVec = result / nrm;
    i = i + 1;
    if i <= k
        errorArr(i) = error;
    end
end

eVal = nrm;

%plot
% semilogy(linspace(1, k, k), errorArr)
% title("Power Method Convergence")
% xlabel("Number of Power Iterations")
% ylabel("Error in Eigenvector")