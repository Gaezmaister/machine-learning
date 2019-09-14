function [gini] = impurity(X,Y)
%GINIINDEX Summary of this function goes here
%   Detailed explanation goes here
    if isempty(X)
         gini = 0;
        return;
    end
    [n, ~] = size(X);
    counts = zeros(3, 1);

    [c, ~] = size(X(Y==1,:));
    counts(1,:) = c;
    [c, ~] = size(X(Y==2,:));
    counts(2,:) = c;
    [c, ~] = size(X(Y==3,:));
    counts(3,:) = c;
    gini = 1 - ((counts(1)/n)^2 + (counts(2)/n)^2 + (counts(3)/n)^2);          
end

