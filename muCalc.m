function [mu] = muCalc(X, numC, centers, m, i)
%This function calculates the membership probability mu for each data item
%   Input parameters:
%       - X => the dataset;
%       - numC => the number of clusters;
%       - centers => the actual centers;
%       - m => the fuzziness parameter;
%       - i => the considered cluster.
%   Output:
%       - mu => a vector with membership percentages.
%   Check operations on input values are not present since all the 
%   constraints on them are preconditions.

    e = 1/(m-1);
    Dnow = SquareDist(X, centers(i,:));
    
    %If the i-th center coincides with a point, we can give their square 
    %distance a very small value instead of 0.
    Dnow(Dnow == 0, :) = 0.00000005;
    
    numeratore = (1./Dnow).^e;
    denominatore = 0;
    for j = 1:numC
        Dall = SquareDist(X,centers(j,:));
        denominatore = denominatore + (1./Dall).^e;
    end
    
    mu = numeratore./denominatore;
    
end

