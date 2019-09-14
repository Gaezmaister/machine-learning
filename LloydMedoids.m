function [idx, centers] = LloydMedoids(X, centers, maxiter)

    k = size(centers, 1);   
    [n, ~] = size(X);     
                            
    idx_prev = zeros(1, n); % 1xn vector storing cluster assignments
    for i = 1:maxiter
        % Compute Squared Euclidean distance (i.e. the squared distance)
        % between each cluster centre and each observation
        D = SquareDist(centers, X);
        % Assign data to clusters
        % Ds are the actual distances and idx are the cluster assignments
        [Ds, idx] = min(D); % find min dist. for each column
        % Update cluster centres
        for c = 1 : k
            %check the number of samples assigned to this cluster
            if( sum(idx==c) == 0 )
                fprintf('cluster %d is empty', c);
            else
                %This is the mean of all the elements of one cluster
                m = mean( X(idx==c,:) );
                %I want to get the point which is closest to m
                D2 = SquareDist(X(idx==c,:),m);
                [Ds, row] = min(D2);
                centers(c, :) = X(row, :);
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
