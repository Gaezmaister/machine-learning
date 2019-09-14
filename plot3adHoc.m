function [] = plot3adHoc(X, Y, on1, name)
%PLOT3ADHOC Summary of this function goes here
%   Detailed explanation goes here
    figure;
    view(3);
    grid on;
    hold all;
    scatter3(X(:, 1), X(:, 2), X(:,3), 25, Y);
    if (size(on1) ~= 0)
        scatter3(on1(:, 1), on1(:, 2), on1(:,3), 50, 'rX');
    end
    xlabel("age");
    ylabel("year");
    zlabel("lymph nodes");
    title(name);
end

