function [ P,D ] = TransitionMatrix(X, bandwith)
% creates graph Laplacian usin Gaussian similarity measure
% Input:
%        X - datapoints, each row is one datapoint
%        bandwith - smoothing parameter, regulaing similarity measure
%        between observations
% Output:
%        P - transition probability matrix
%        D - diagonal matrix, D(i,i) - degree of node i , i.e. sum of all
%        weights of verticers adjacent to node i
%
% Author: Amazasp Shaumyan

% number of observations
n = size(X,1);
% calculate similarity weight matrix
Distance = zeros(n);
for i = 1:size(X,1)
    Distance(i,:) = diag((repmat(X(i,:),n,1)-X)*(repmat(X(i,:),n,1)-X)');
end
% weight matrix
W = exp(-Distance./bandwith.^2);
D = zeros(size(W));
for i = 1:size(W,1)
    D(i,i) = sum(W(i,:));
end
% calculate transitional probability matrix
P = inv(D)*W;
end

