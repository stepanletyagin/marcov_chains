function [series] = time_resampling(series, param_one, param_two)

tau = 0.01;

% states_sort = unique(states.','rows').';

for i = 1:length(series)
    time = series{1, i}(12, :);
    [time_sort unique_indeces] = unique(time);
    first_data = series{1, i}(param_one, :);
    second_data = series{1, i}(param_two, :);
    first_data_sort = first_data(unique_indeces);
    second_data_sort = second_data(unique_indeces);
    clear unique_indeces;       
    time_interp = linspace(min(time), max(time), length(time));
    series{1, i}(param_one, :) = interp1(time_sort, first_data_sort, time_interp);
    series{1, i}(param_two, :) = interp1(time_sort, second_data_sort, time_interp);
    series{1, i}(12, :) = time_interp;
end

% for i = 2:length(series{1, 1}(12, :))
%     series{1, 1}(12, i) = series{1, 1}(12, i - 1) + tau; 
% end

end