function [angle_series] = time_resampling(series, param_one, param_two)

tau = 0.1; %Interpolation step

% states_sort = unique(states.','rows').';

for i = 1:length(series)
    time = series{1, i}(12, :);
    [time_sort unique_indeces] = unique(time);
    first_data = series{1, i}(param_one, :);
    second_data = series{1, i}(param_two, :);
    first_data_sort = first_data(unique_indeces);
    second_data_sort = second_data(unique_indeces);
    clear unique_indeces;       
% 	time_interp = linspace(min(time), max(time), length(time));
%   series{1, i}(param_one, :) = interp1(time_sort, first_data_sort, time_interp);
%   series{1, i}(param_two, :) = interp1(time_sort, second_data_sort, time_interp);
%   series{1, i}(12, :) = time_interp;
    time_interp = min(time):tau:max(time);
    angle_series{1, i}(1, :) = interp1(time_sort, first_data_sort, time_interp);
    angle_series{1, i}(2, :) = interp1(time_sort, second_data_sort, time_interp);
    angle_series{1, i}(3, :) = time_interp;

%     time = series{1, i}(12, :);
%     [time_sort unique_indeces] = unique(time, 'stable');
%     first_data = series{1, i}(param_one, :);
%     second_data = series{1, i}(param_two, :);
%     first_data_sort = first_data(unique_indeces);
%     second_data_sort = second_data(unique_indeces);
%     clear unique_indeces;
%     time_interp = min(time):tau:max(time);
%     angle_series{1, i}(1, :) = interp1(time_sort, first_data_sort, time_interp);
%     angle_series{1, i}(2, :) = interp1(time_sort, second_data_sort, time_interp);
%     angle_series{1, i}(3, :) = time_interp;
    
% createFigure;
% hold on;
% subplot(2,1,1);
% plot(angle_series{1, i}(3, :), angle_series{1, i}(1, :));
% title('Gait');
% 
% subplot(2,1,2);
% plot(angle_series{1, i}(3, :), angle_series{1, i}(2, :));
% grid on;

end

end