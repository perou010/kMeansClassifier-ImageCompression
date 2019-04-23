% The MyKmeansUpdateR updates r, given the current mu values
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
function r = MyKmeansUpdateR(X,K,mu)
r = zeros(size(X,1), K);
for pixel = 1:size(X,1)
    [minval, minarg] = min(vecnorm(X(pixel,:) - mu,2,2));
    r(pixel, minarg) = 1; 
end
end

