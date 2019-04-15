clear all;
close all;
clc;

%% Initial Set Up
I = [2 3 1 3 4 4 1];
J = [1 1 2 2 2 3 4];

% Create the Adjacency matrix/Connectivity matrix from I,J
H = full(sparse(I,J,1,4,4));

% Plot the directed graph
G = digraph(H'); 
% plot(G); 

% calculate in-degree and out-degree
r = sum(H,2);  % out-degree, sum of each row
c = sum(H,1);  % in-degree, sum of each column
% 
% % create the scaled matrix Ht
Ht = H*diag(1./c);
% pr =  centrality(G,'pagerank','FollowProbability',0.85);

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
% e = ones(4,1);
% v = e/4;
% Ga = alpha*Ht+(1-alpha)*v*e';
% p = rand(4,1);  % random initial vector
% p = p/sum(p);   % normalise p to have unit sum
% for k=1:10      % only a few iterations are needed to create the same ranking
%     p = Ga*p;
% end
% [newp,rank] = sort(p,'descend'); % sort in descending order


%% Method 3
% Find the PageRank Vector 
% Using Arnoldi Decomposition and QR Algorithm
[m, n] = size(Ht);
randomVector = rand(m,1);
q1 = randomVector / norm(randomVector);
arnoldiIter = 4;
[Q,H] = arnoldi(Ht,q1,arnoldiIter);
qrIter = 100;
Hcopy = H;

% eps = 0.01;
% for n = length(Hcopy):-1:2   
%   % QR iteration
%   while sum( abs(Hcopy(n,1:n-1)) ) > eps
%     s = Hcopy(n,n);
%     [Qcopy,R] = qr(Hcopy-s*eye(n));
%     A = R*Qcopy + s*eye(n);V
%   end 
%   % Deflation
%   Hcopy = Hcopy(1:n-1,1:n-1);
% end

for i=1:qrIter; 
    [Qcopy,R] = qr(Hcopy);
    Hcopy=R*Qcopy; 
end

[V1,D1] = eig(Hcopy);
% p1 = V1(:,1)/sum(V1(:,1));         % normalised eigenvector as the PageRank vector
% [newp1,rank1] = sort(p1,'descend'); % sort in descending ord


