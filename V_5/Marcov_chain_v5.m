clc
clear all

importfile('data.mat');

x_state_limit = 55;
y_state_limit = 51;
x_min = 0;
x_max = 70;
y_min = -50;
y_max = 31;

%Assigning values
values = movement_type(data_union, 17);

%Cell array of series
series = series_splitting(values);

%Time resampling
series = time_resampling(series, 7, 8);

%Set array of angles only
array = [];
for i = 1:length(series)
 array = [array series{1, i}];
end

angles = [array(1, :); array(2, :)];

createFigure;
plot(angles(1, :), angles(2, :),'b.');
title('Test');
grid on;

%Creating states
states = create_states(series, x_state_limit, y_state_limit, x_min, x_max, y_min, y_max);

%Creating cell array of frequencies
frequency_cell = transition_frequencies_search(states, angles);

%Creating frequencies matrix from cell array
transition_frequencies_matrix = create_frequency_matrix(frequency_cell);

%Creating transition matrix
transition_matrix = create_trans_matrix(states, transition_frequencies_matrix);

%Creating centers
centers = centers_search(x_state_limit, y_state_limit, x_min, x_max, y_min, y_max);

current_state = [2; -2];
% n = find_state(centers, current_state);

%Prediction
states_sequence = generate_new_states(transition_matrix, current_state, centers, angles);

%STD error
STD = std(angles(1, :), states_sequence(1, :));

%%
%State plot
print_graph(angles, states_sequence, 'Stairs ascending');