function [idx, centers] = Lloid(X, centers, maxiter)

    k = size(centers, 1);   
    [n, dim] = size(X);     
                            
    idx_prev = zeros(1, n); 
    for i = 1:maxiter
        D = SquareDist(centers, X);
        [Ds, idx] = min(D);
        for c = 1 : k
            if( sum(idx==c) == 0 )
                fprintf('cluster %d is empty', c);
            else
                centers(c, :) = mean( X(idx==c,:) );
            end
        end
        if( sum( abs(idx - idx_prev) ) == 0 )
            break;
        end
        idx_prev = idx;
    end
end