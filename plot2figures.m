function [] = plot2figures(X, Y, on1, name)
%PLOT3ADHOC Summary of this function goes here
%   Detailed explanation goes here
    [n,d] = size(Y);
    figure;
    grid on;
    hold all;
    if d ~= 1
        Y = Y';
    end
    scatter(X(Y==1, 1), X(Y==1, 2), 25, Y(Y==1, :), 'bo');
    scatter(X(Y==2, 1), X(Y==2, 2), 25, Y(Y==2, :), 'yo');
    scatter(X(Y==3, 1), X(Y==3, 2), 25, Y(Y==3, :), 'go');

    if (size(on1) ~= 0)
        scatter(on1(:, 1), on1(:, 2), 50, 'rX');
    end
    legend("setosa", "versicolor", "virginica")
    xlabel("sepal length");
    ylabel("sepal width");
    title(name);
    
    figure;
    grid on;
    hold all;
    scatter(X(Y==1, 3), X(Y==1, 4), 25, Y(Y==1, :), 'bo');
    scatter(X(Y==2, 3), X(Y==2, 4), 25, Y(Y==2, :), 'yo');
    scatter(X(Y==3, 3), X(Y==3, 4), 25, Y(Y==3, :), 'go');
    if (size(on1) ~= 0)
        scatter(on1(:, 3), on1(:, 4), 50, 'rX');
    end
    legend("setosa", "versicolor", "virginica")
    xlabel("petal length");
    ylabel("petal width");
    title(name);
end

