% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [P,v] = house_gen(x)
% generate house matrix given column vector
n = length(x);
e1 = zeros(n,1);
e1(1) = 1;
v = x + sign(x(1)) * norm(x) * e1;
P = eye(n) - 2*(v*v')/(v'*v);
end

