% The MyKmeansUpdateMu updates mu, given the current r values
%
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
function mu = MyKmeansUpdateMu(X,K,r)
sum_r = sum(r);
sum_top = zeros(K,3);
for k = 1:K
    sum_top(k,:) = sum(X(r(:,k) == 1,1:end));
end
mu = zeros(K,3);
for k = 1:K
   if sum_r(k) ~= 0
       mu(k,1:end) = sum_top(k,1:end) / sum_r(k);
   else % if cluster based on current centroid is empty, then make it a random 3-tuple of values (0,1)
       mu(k,1:end) = rand(3,1);
   end
end







%%%%
end

