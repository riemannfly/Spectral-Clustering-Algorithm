clear; clc; close all;
x = 10*randn(20000,2);
z = x((x(:,1).^2+x(:,2).^2 < 12 & x(:,1).^2+x(:,2).^2 > 9),:);
Z = x((x(:,1).^2+x(:,2).^2 < 1),:);
plot(z(:,1), z(:,2), 'b+')
hold on
plot(Z(:,1), Z(:,2), 'r+')
hold off
xlabel('x')
ylabel('y')
title('original cluster division')
X = [z;Z];
figure
I = SpectralClustering(X,2,1,20,'rw' );
figure
z = 1.45*randn(500,2);
Z = 5+2*randn(500,2);
plot(z(:,1), z(:,2), 'b+')
hold on
plot(Z(:,1), Z(:,2), 'r+')
hold off
xlabel('x')
ylabel('y')
title('original cluster division')
X = [z;Z];
% perform spectral clustering (use Lrw (basically it finds invariant probability
%  measure and use transient))
figure
I = SpectralClustering(X,2,4,20,'rw' );
