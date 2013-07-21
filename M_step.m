function [ I ] = M_step( X,centroids )
% MSTEP in k-means algorithm computes assignment of points after
% centroids are calculated

% number of classes
m = size(centroids,1);
% number of data points
n = size(X,1);
% preallocation of memory for matrix that should contain distances from
% data points to centroids
D = zeros(n,m);
% compute distance form each point to each centroid
for i = 1:m
    C = repmat(centroids(i,:),n,1);
    D(:,i) = diag((X - C)*(X - C)');
end
% find partition of data points
[Min,I] = min(D,[],2);
%I(1:5)
%I(51:55)  
%I(102:107)
end

