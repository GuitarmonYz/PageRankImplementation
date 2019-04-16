function [P,v] = house_gen(x)
n = length(x);
en = zeros(n,1);
en(n) = 1;
v = x + sign(x(1)) * norm(x) * en;
P = eye(n) - 2*(v*v')/(v'*v);
end

