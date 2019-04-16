function [P,v] = house_gen(x)
n = length(x);
e1 = zeros(n,1);
e1(1) = 1;
v = x + sign(x(1)) * norm(x) * e1;
P = eye(n) - 2*(v*v')/(v'*v);
end

