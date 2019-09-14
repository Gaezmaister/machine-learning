function [boundaries, dimensions, species] = DecisionTreeTrain(Xtr, Ytr, maxdepth)

    [n, d] = size(Xtr);
    boundaries = [];
    dimensions = [];
    species = [];
    
    if maxdepth == 0
        boundaries = vertcat(boundaries, 0);
        dimensions = vertcat(dimensions, 0);
        species = vertcat(species, [0,0]);
        return;    
    end
     
     if size(Ytr) == 1
        boundaries = vertcat(boundaries, 0);
        dimensions = vertcat(dimensions, 0);
        species = vertcat(species, [0,0]);
        return;
     end
     
     if isempty(Ytr)
        boundaries = vertcat(boundaries, 0);
        dimensions = vertcat(dimensions, 0);
        species = vertcat(species, [0,0]);
        return;
     end
     
    impurities = impurity(Xtr, Ytr);
    [gain, boundary, dim] = findBestSplit(Xtr, Ytr, impurities);
    if gain == 0
        boundaries = vertcat(boundaries, 0);
        dimensions = vertcat(dimensions, 0);
        species = vertcat(species, [0,0]);
        return;
    end
    [Xleft, Yleft, Xright, Yright, vmaj, vmin] = splitSet(Xtr, Ytr, boundary, dim);
    

    boundaries = vertcat(boundaries, boundary);
    dimensions = vertcat(dimensions, dim);
    species = vertcat(species, [vmaj,vmin]);

    [boundaryleft, dimensionleft, vleft] = DecisionTreeTrain(Xleft, Yleft, maxdepth-1);
    [boundaryright, dimensionright, vright] = DecisionTreeTrain(Xright, Yright, maxdepth-1);

    boundaries = horzcat(boundaries, boundaryleft);
    boundaries = horzcat(boundaries, boundaryright);
    dimensions = horzcat(dimensions, dimensionleft);
    dimensions = horzcat(dimensions, dimensionright);
    species = horzcat(species, vleft);
    species = horzcat(species, vright);

    
    
end

