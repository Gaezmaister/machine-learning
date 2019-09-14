function [bounds,dims, species] = AddZeros(bounds,dims, species)
%ADDZEROS Summary of this function goes here
%   Detailed explanation goes here
    [~,n] = size(bounds);
    for i = 1:n
        if bounds(i) == 0 && i*2 < n
            if bounds(i*2) ~= 0 || bounds(i*2+1) ~= 0
                aux = bounds(:, i*2:end);
                bounds(:, i*2:end) = [];
                bounds = horzcat(bounds, [0,0]);
                bounds = horzcat(bounds, aux);
                
                aux = dims(:, i*2:end);
                dims(:, i*2:end) = [];
                dims = horzcat(dims, [0,0]);
                dims = horzcat(dims, aux);
                
                aux = species(:, i*4:end);
                species(:, i*4-1:end) = [];
                species = horzcat(species, [0,0,0,0]);
                species = horzcat(species, aux);
                
            end
        end
    end
end

