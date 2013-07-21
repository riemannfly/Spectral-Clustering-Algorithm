function [ Partition, p ] = SpectralClustering( X,k,bandwith, n_iter, method )
% performs spectral clustering
% measure
% Input:
%       X - matrix of data points, each row is one observation
%       k - number of clusters
%       banwith - smoothing parameter for Gaussian Kernel used for
%       similarity matrix construction
%       n_iter - number of iterations in K means 
% Output:
%       Partition - column vector assigning each observation its cluster
%
% Author: Amazasp Shaumyan


[P] = TransitionMatrix(X, bandwith);
switch method
    case 'rw'
        [Partition] = SpectralClusteringRW_normalised(P,k,n_iter);
    case 'sym'
        disp('not ready yet')
    case 'unnormalised'
        disp('not ready yet')
end
% if data is two dimensional vizualize it 
colors = {'r+', 'b+', 'c+', 'k+'};
if size(X,2)==2
    plot(X(Partition==1,1), X(Partition==1,2), colors{1})
    xlabel('x')
    ylabel('y')
    title('spectral clutering: resulting clusters')
    hold on
    for i = 2:k
        plot(X(Partition==i,1), X(Partition==i,2), colors{i})
        xlabel('x')
        ylabel('y')
        title('spectral clustering: resulting clusters')
    end
end
p=1;
end

