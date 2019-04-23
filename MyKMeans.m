% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
% The function should return:
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
% - J (2*iter x 1): Error function value calculated after every r-update
% and mu-update. If MyKmeans converges in iter iterations, the vectors has
% 2*iter values
function [r,mu,J] = MyKMeans(X,K)
    max_iter = 100;
    
    rng(5);
    N = size(X,1);
    m_idx = randperm(N);
    mu = X(m_idx(1:K),:); % <-- mu starts with random rows of X
    
    j = [];
    for iter=1:max_iter
        % update r, using MyKmeansUpdateR
        r = MyKmeansUpdateR(X,K,mu);
        
        % calculate error function, using current r and mu        
        J_0 = MyKmeansErrorFunction(X,r,mu);
        j = [j;J_0];
        
        
        % update mu, using MyKmeansUpdateMu

        mu = MyKmeansUpdateMu(X,K,r);
        
        % calculate error function, using current r and mu
        
        J = MyKmeansErrorFunction(X,r,mu);
        j = [j;J];
        

        if size(j,1) ~= 2
            disp( j(2*iter-2) - j(2*iter));
        end
        
        if size(j,1) == 2 
            %do nothing
        elseif (abs(j(2*iter-2) - j(2*iter)) < 1e-6)
            break;
       
        end
    end
    J = j;
    %disp(mu)
end

