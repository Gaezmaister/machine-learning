function [Ypred] = DecisionTreeTest(Xts, boundaries, dimensions, species, index)
%DECISIONTREETEST Summary of this function goes here
%   Detailed explanation goes here

[n, ~] = size(Xts);
[~, b] = size(boundaries);
Ypred = zeros(n, 1);

i = index;
curBoundaries = boundaries(:,i);
curDimensions = dimensions(:,i);

leftLogic = Xts(: , curDimensions) < curBoundaries;
rightLogic = Xts(: , curDimensions) >= curBoundaries;

if curBoundaries == 0
    return;
end

if i*2 < b
    leftChild = boundaries(:,i*2); %Guardo i passi successivi
    rightChild = boundaries(:,i*2+1);
else % Vuol dire che non ci sono più figli e siamo all'ultimo giro
    if species(:,i*2) ~= 0 
       Ypred(leftLogic, :) = species(:,i*2);
       Ypred(Ypred(:,:) == 0, :) = species(:,i*2);
       species(:,i*2)
    end
    if species(:,i*2-1) ~= 0
        Ypred(rightLogic, :) = species(:,i*2-1);
        Ypred(Ypred(:,:) == 0, :) = species(:,i*2-1);
        species(:,i*2-1)
    end
    return;
end

leftBranch = Xts(leftLogic, :);
rightBranch = Xts(rightLogic, :);

if leftChild == 0
    if species(:,i*2) ~= 0
        Ypred(leftLogic, :) = species(:,i*2);
    end
end

if rightChild == 0
    if species(:,i*2-1) ~= 0
        Ypred(rightLogic, :) = species(:,i*2-1);
    end
end

if leftChild ~= 0 
  Yleft = DecisionTreeTest(leftBranch, boundaries, dimensions, species, i*2);
  Ypred(leftLogic, :) = Yleft(:,:)
end
if rightChild ~= 0
  Yright = DecisionTreeTest(rightBranch, boundaries, dimensions, species, i*2+1);
  Ypred(rightLogic, :) = Yright(:,:)
end



