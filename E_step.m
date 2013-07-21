function [ Centroids] = E_step( X, I, m )
% E_step calculates expectattion based on information about
% data partitioning between clusters

Centroids = zeros(m,size(X,2));

for i = 1:m
    % choose points corresponding to i-th cluster
    Index = (I == i);
    Centroids(i,:) = mean(X(Index,:),1);
end


end

