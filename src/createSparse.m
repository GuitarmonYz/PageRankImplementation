% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16
function [result] = createSparse(n, p)
% Create synthetic test data
% input
% n: row number or column number of the sparse matrix
% p: the larger p value is, more 1 is in the sparse matrix
% output:
% den: sparse matrix
index = linspace(1, n, n);
indices = repelem(index, n);
num = floor(p*n^2);
values = ones(1, num);

rowIndex = datasample(indices, num, 'Replace', false);
colIndex = -1 .* datasample(indices, num, 'Replace', false);

for i = 1:num
    if rowIndex(i) + colIndex(i) == 0
        if rowIndex(i) == n
            rowIndex(i) = randi([1, n-1]);
        elseif rowIndex(i) == 1
            rowIndex(i) = randi([2, n]);
        else
            if rand(1) <= 0.5
                if rowIndex(i) == 2
                    rowIndex(i) = randi([3, n]);
                else
                    rowIndex(i) = randi([2, rowIndex(i)-1]);
                end
            else
                if rowIndex(i) == n-1
                    rowIndex(i) = randi([1, n-2]);
                else
                    rowIndex(i) = randi([rowIndex(i)+1, n-1]);
                end
            end
        end
    end
end

colIndex = -1.*colIndex;

S = sparse(rowIndex, colIndex, values, n, n);
result = S./S;
result(S==0)=0;
result=full(result);
