function [ centers ] = randomCenters(Xtr, k)
%This function retrieves random centers from the input dataset
%   If Xtr has dim > 3, they'll be all taken into account   
%    Input params:
%   - Xtr => the training set we consider;
%   - k => the number of clusters.
%   Output param:
%   - centers => the retrieved centers.

    [n,~] = size(Xtr);
    
    centers(1,:) = Xtr(randi(n,1),:);
    
    for i = 2:k
        randrow = randi(n);
        %The whole data row will be taken as a new center
        centers(i,:) = Xtr(randrow, :); 
    end
end

