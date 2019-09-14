function [bestgain, bestbound, bestdim] = findBestSplit(X, Y, imp)

    bestgain = 0;
    bestbound = 0;
    bestdim = 0;
    [~, d] = size(X);
    for i = 1:d
        values = unique(X(:,i));
        [v, ~] = size(values);
        for j = 1:v
            bound = values(j);
            imp1 = impurity(X(X(:,i) >= bound, :), Y(X(:,i) >= bound));
            imp2 = impurity(X(X(:,i) < bound, :), Y(X(:,i) < bound));
            gain = imp - (imp1 + imp2);
            if gain > bestgain
                bestgain = gain;
                bestbound = bound;
                bestdim = i;
            end
        end
    end
end

