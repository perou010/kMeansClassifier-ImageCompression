% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
% - j (1 x 1): Error function calculated using the current mu and r
function j = MyKmeansErrorFunction(X,r,mu)
j = 0;
for pixel = 1:size(r,1)
    for k = 1:size(mu, 1)
        j = j + (r(pixel,k) * norm(X(pixel) - mu(k,1:end)));
    end
end
end

