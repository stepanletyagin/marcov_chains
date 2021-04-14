clc
clear all

importfile('data.mat');

x_state_limit = 8;
y_state_limit = 8;
x_min = 0;
x_max = 80;
y_min = -50;
y_max = 30;

%Assigning values
values = movement_type(data_union, 1);

%Cell array of series
series = series_splitting(values);

%Time resampling
series = time_resampling(series, 7, 8);

array = [];
for i = 1:length(series)
 array = [array series{1, i}];
end

angles = [array(7, :); array(8, :)];

%Creating states
states = create_states(series, x_state_limit, y_state_limit, x_min, x_max, y_min, y_max);

%Creating cell array of frequencies
frequency_cell = transition_frequencies_search(states, angles);

% states1 = {[], [], []; [], [], []};
% states1{1, 1}(1, 1) = 3;
% states1{1, 1}(2, 1) = 7;
% 
% states1{1, 1}(1, 2) = 2;
% states1{1, 1}(2, 2) = 8;
% 
% states1{1, 2}(1, 1) = 6;
% states1{1, 2}(2, 1) = 10;
% 
% states1{1, 3}(1, 1) = 8;
% states1{1, 3}(2, 1) = 7;
% 
% states1{1, 3}(1, 2) = 8;
% states1{1, 3}(2, 2) = 7;
% 
% states1{1, 3}(1, 3) = 9;
% states1{1, 3}(2, 3) = 10;
% 
% states1{2, 1}(1, 1) = 2;
% states1{2, 1}(2, 1) = 2;
% 
% states1{2, 1}(1, 2) = 3;
% states1{2, 1}(2, 2) = 5;
% 
% states1{2, 1}(1, 3) = 3;
% states1{2, 1}(2, 3) = 5;
% 
% states1{2, 3}(1, 1) = 8;
% states1{2, 3}(2, 1) = 3;
% 
% states1{2, 3}(1, 2) = 8;
% states1{2, 3}(2, 2) = 3;
% 
% 
% arr1(1, :) = [2 3 3 6 8 3 8 2 8 8 9];
% arr1(2, :) = [2 5 5 10 7 7 7 8 3 3 10];
% 
% frequency_cell = transition_frequencies_search(states1, arr1);

%Creating frequencies matrix from cell array
transition_frequencies_matrix = frequency_matrix_search(frequency_cell);

%Creating transition matrix
transition_matrix = create_trans_matrix(states, transition_frequencies_matrix);

%Creating centers
% centers = centers_search(x_state_limit, y_state_limit, x_min, x_max, y_min, y_max);

% current_state = [2; 7];
% states_sequence = generate_states(transition_matrix, current_state, centers, x_state_limit, y_state_limit, x_min, x_max, y_min, y_max);

% plot(states_sequence_first, states_sequence_second,'g.');
% hold off;

% createFigure;
% hold on;
% plot(states_curr(7, :), states_curr(8, :),'b.');
% title('Gait');
% grid on;

% % Checking whether the sum of each row is equal to 1
sum = 0;
for i = 1:length(transition_matrix)
    sum = transition_matrix(17, i) + sum;
end
disp(sum);




