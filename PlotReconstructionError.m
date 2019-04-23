% The PlotReconstructionError plot the reconstruction error in J, so that 
% even position have one color and odd positions another color
% - J (iter*2 x 1): Vector with all the reconstruction errors returned by 
% MyKMeans
function PlotReconstructionError(J)
hold on
for i = 1:size(J,1)
    if mod(i,2) == 0
        scatter(i,J(i),[],'r');
    else 
        scatter(i,J(i),[],'b');
    end
end
end

