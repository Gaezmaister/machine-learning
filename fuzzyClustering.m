function [idx, centers] = fuzzyClustering(X, centers, m, maxiter)
%This fuzzy clustering function performs the fuzzy c-means, taking into
%account the fuzziness parameter m. 
%   Input parameters:
%       - X => the dataset;
%       - centers => a vector in which centers are stored;
%       - m => the fuzziness parameter, it must be between 1 and n, 
%              where n is the total number of data items;
%       - maxiter => the maximum number of iteration to be executed.
%   Output:
%       - idx => a vector containing the final clusters;
%       - centers => the final centers.
%   This fuzzy algorithm assumes that a data item can belong to more than
%   one cluster so it computes a probability memberhip mu out of the 
%   fuzziness parameter and updates the cluster centers according to that.
%   If m is very big (n) or very small (1) is very likely than just 1
%   cluster will be retrieved.

    k = size(centers, 1);   
    [n, dim] = size(X); 
    
    %Check operations on parameter m
    if (m > n || m < 1)
        fprintf('m has to be grater than %d smaller than %d', 1, n);
        return;
    end
                            
    idx_prev = zeros(1, n); % 1xn vector storing cluster assignments
    for i = 1:maxiter
        % Compute Squared Euclidean distance (i.e. the squared distance)
        % between each cluster centre and each observation
        D = SquareDist(centers, X);
        % Assign data to clusters
        % idx are the cluster assignments
        [~, idx] = min(D); % find min dist. for each column
        % Update cluster centres
        for c = 1 : k
            %check the number of samples assigned to this cluster
            if( sum(idx==c) == 0 )
                fprintf('cluster %d is empty', c);
            else
                %calculate the membership percentage mu
                mu = muCalc(X, k, centers, m, c);
                %resize mu to make the elementwise product with the data
                mu = repmat(mu, [1, dim]); 
                
                %select the data assigned to the c-th center.
                Xc = X(idx==c,:);
                
                %update the centers with the fuzzy clustering algorithm
                numerat = sum(((mu(idx==c,:).*Xc).^m).*Xc);
                denom = sum((mu(idx==c,:).*Xc).^m);
                centers(c, :) = numerat./denom;
            end
        end
        % Check for convergence
        if( sum( abs(idx - idx_prev) ) == 0 )
            break;
        end
        % update previous assignment vector with current
        idx_prev = idx;
    end
end


