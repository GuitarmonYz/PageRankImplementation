% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16

clear;
close all;
clc;

%% Initial Set Up of small dataset for testing algorithm only
I = [2 3 1 3 4 4 1];
J = [1 1 2 2 2 3 4];

% % Create the Adjacency matrix/Connectivity matrix from I,J
% H = full(sparse(I,J,1,4,4));
rowNumber = 20;
H = createSparse(rowNumber, 0.8);

% Plot the directed graph
% names = {'vertex1', 'vertex2', ...
%          'vertex3', 'vertex4'};
% G = digraph(H',names);
G = digraph(H');
% plot(G); 
% 
% % calculate in-degree and out-degree
r = sum(H,2);  % out-degree, sum of each row
c = sum(H,1);  % in-degree, sum of each column
% 
% % % create the scaled matrix Ht
Ht = H*diag(1./c);

%% Method 1
% Find the PageRank vector 
% from eigenvalues associated with the eigenvector directly

% [V,D] = eig(Ht);    % find the eigenvalues and the eigenvectors
% [~,ind] = min(abs(diag(D)-1));  % find the index of the eigenvalue 1 (not exactly because of numerical error)
% p = V(:,1)/sum(V(:,1));         % normalised eigenvector as the PageRank vector
% [newp,rank] = sort(p,'descend'); % sort in descending order


%% Method 2
% Find the PageRank vector
% Using Google Matrix by Iteration

% alpha = 0.85;
% e = ones(rowNumber,1);
% v = e/rowNumber;
% Ga = alpha*Ht+(1-alpha)*v*e';
% p = rand(rowNumber,1);  % random initial vector
% p = p/sum(p);   % normalise p to have unit sum
% iterNumber = 100;
% for k=1:iterNumber      % only a few iterations are needed to create the same ranking
%     p = Ga*p;
% end
% [newp,rank] = sort(p,'descend'); % sort in descending order
% 

%% Method 3
% Find the PageRank Vector 
% Using Arnoldi Decomposition and QR Algorithm
[m, n] = size(Ht);
% randomVector = rand(m,1);
% q1 = randomVector / norm(randomVector);

% Arnoldi Decomposition
arnoldiIter = 100;
[Q,H] = arnoldi(Ht,arnoldiIter);

% QR Algorithm
qrIter = 100;
[H_prime, Q_prime] = practical_qr(H, qrIter);
V = mtimes(Q,Q_prime);
D = diag(H_prime);
p = V(:,1)/sum(V(:,1)); % normalised eigenvector as the PageRank vector
[newp,rank] = sort(p,'descend'); % sort in descending ord

%% Visuliaztion for Large Dataset
% load processed_data.mat
% G = data;
% G = processed_data.mat;
pr = centrality(G,'pagerank','MaxIterations',200,'FollowProbability',0.85);
G.Nodes.PageRank = pr;
G.Nodes.InDegree = indegree(G);
G.Nodes.OutDegree = outdegree(G);
G.Nodes(1:10,:); % View the Top 25 Resulting Scores

% Extract and plot a subgraph containing all nodes whose score is greater than 0.005.
% Color the graph nodes based on their PageRank score.
vizGraph = subgraph(G,find(G.Nodes.PageRank > 0.005));
plot(vizGraph,'NodeLabel',{},'NodeCData',vizGraph.Nodes.PageRank,'Layout','force');
title('Visualization for Sparse Matrix')
colorbar
