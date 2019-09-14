function [Xleft, Yleft, Xright, Yright, vmaj, vmin] = splitSet(Xtr, Ytr, boundary, dim)
%SPLITSET Summary of this function goes here
%   Detailed explanation goes here
    if size(Ytr) == 1
        return;
    end
    Xmaj = Xtr(Xtr(:, dim) >= boundary, :);
    Ymaj = Ytr(Xtr(:, dim) >= boundary, :);
    Xmin = Xtr(Xtr(:, dim) < boundary, :);
    Ymin = Ytr(Xtr(:, dim) < boundary, :);
    
    Xright = Xmaj;
    Yright = Ymaj;
    Xleft = Xmin;
    Yleft = Ymin;
    
    [one, ~] = size(Xmaj(Ymaj==1,:));
    [two, ~] = size(Xmaj(Ymaj==2,:));
    [three, ~] = size(Xmaj(Ymaj==3,:));

    if one > (two + three)
       vmaj = 1;
    elseif two > (one + three)
        vmaj = 2;
    else
        vmaj = 3;
    end
    
    [one, ~] = size(Xmin(Ymin==1,:));
    [two, ~] = size(Xmin(Ymin==2,:));
    [three, ~] = size(Xmin(Ymin==3,:));

    if one > (two + three)
       vmin = 1;
    elseif two > (one + three)
        vmin = 2;
    else
        vmin = 3;
    end
    
end


