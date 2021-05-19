function [index] = series_splitting_index(time)

n = length(time);
delta = 1;
index = []; % End of each series index array

index = [index 1]; %First series

for i = 2:n
%     if (time(i) - time(i - 1) > delta)
    if (abs(time(i) - time(i - 1)) > delta)
        index = [index (i)];
    end
end

index = [index n + 1]; %Last series

end