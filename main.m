[X,w,h] = ReadBmpImage('stadium.bmp');
Ks = [3,5,13];
figure % create a new window to plot
for i=1:length(Ks)
    K = Ks(i);
    % run kmeans on X, for K clusters, using MyKmeans
    [r,mu,J] = MyKMeans(X, K); 
    % Generate new X_new with K colors resulting from MyKmeans
    % X_new will have same size as X, but with K colors only
    X_new = zeros(size(r,1), 3);
    for pixel = 1:size(r,1)
        for k = 1:K
            if r(pixel,k) == 1
                X_new(pixel,:) = mu(k,:);
            end
        end
    end
    %disp(X_new)   
    subplot(2,3,i); % <--- this line will create a subplot in the window created by "figure". You can change/remove if you want
    % View image using X_new, using PlotBmpImage (the function is already
    PlotBmpImage(X_new, h, w);
    %%%%
    subplot(2,3,3+i); % <--- this line will create a subplot in the window created by "figure". You can change/remove if you want
    PlotReconstructionError(J); 
    %%%%
    
end
