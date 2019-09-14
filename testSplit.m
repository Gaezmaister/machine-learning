function [Xtr,Ytr,Xts,Yts] = testSplit(Xtr, Ytr, percTs)
    if (percTs > 1 || percTs < 0)
        fprintf('percTs has to be grater than %d smaller than %d', 0, 1);
        return;
    end
    
    [n, ~] = size(Xtr);
    numTs = floor(n * percTs);
    
    split = zeros(numTs, 1);
    
    for i = 1:numTs
        ex = randi(n);
        while(ismember(ex, split))
            ex = randi(n);
        end
        split(i) = ex;
    end
    
    Xts = Xtr(split, :);
    Xtr(split, :) = [];
    Yts = Ytr(split, :);
    Ytr(split, :) = [];
      
end

