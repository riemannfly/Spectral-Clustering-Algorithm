function [ Partition] = SpectralClusteringRW_normalised( P,k, n_iter )
% given transition matrix for random walk calculates invariant probability
% measure
% Input:
%       P - transitional probability matrix
%       k - number of clusters
% Output:
%       P_inv - invariant probability measure, (limit of transition matrix)
%
% Author: Amazasp Shaumyan

% decompose transitional matrix into eigenvectors
[V,D] = eig(eye(size(P)) - P);
% sort in ascending order
[not_used, I] = sort(sum(D,1), 'ascend');
V = V(:,I);
D = D(:,I);
% select k smallest eigenvalues and eigenvectors corresponding to them
V_select = V(:,1:k);
% consider each row of V_select being an observation and use K-means for
% clustering
[Partition] = Kmeans(V_select, k, n_iter);


end

