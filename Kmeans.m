function [ I,C,p ] = Kmeans( X,N, iter)
% performs K-means clustering 
% Input: 
%       X - data matrix , each row is separate data point
%       N - number of assumed clusters
%       iter - maximum number of iterations of algorithm before stop
%
% Output:
%       I - assigns index of cluster to each point
%       C - represents centroids of each cluter
%       
% Author: Amazasp Shaumyan, 2013 (Motion Picture Laboratories, Inc.)



% randomly initialize cenroids to be from set X
initial_centroids = datasample(X,N,1,'Replace',false);
% initialize class of each pont 
I = M_step(X,initial_centroids);
cost = zeros(floor(iter/10),1);
counter = 1;
for i = 1:iter
    
    C = E_step(X,I,N); % calculate centroids
    I = M_step(X,C);   % calculate data partition into clusters
    % calculate cost function (it must be monotonically decreasing function of 
    % inputs)
    I_prev = I;
    sum(I~=I_prev);
    if rem(i,10)==0    % each 10 iterations calculate cost function for K-means
        c = 0;
        for j = 1:N
            c = c + sum(diag((X(I==j,:)-repmat(C(j,:),sum(I==j),1))*(X(I==j,:)-repmat(C(j,:),sum(I==j),1))'));
        end
        cost(counter) = c;
        close;
        figure;
        plot(cost, 'r-', 'LineWidth',3);
        xlabel('Iterations');
        ylabel('Cost')
        counter = counter + 1;
    end
end
% visualize for 2 dimensional case 
% up to 5 clusters
col = {'r+','b+','k+','c+','g+'};
if size(X,2)==2
    figure
    plot(X(I==1,1),X(I==1,2), col{1}, 'MarkerSize', 3)
    hold on
    for i = 2:N
        plot(X(I==i,1),X(I==i,2), col{i}, 'MarkerSize', 3)
    end
end
p = 1;
end

