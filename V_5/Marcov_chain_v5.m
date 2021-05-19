clc
clear all

importfile('data.mat');

x_state_limit = 108;
y_state_limit = 101;
x_min = 0;
x_max = 70;
y_min = -50;
y_max = 30;

%Assigning values
values = movement_type(data_union, 1);

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

current_state = [2; 7];

%Prediction
states_sequence = generate_new_states(transition_matrix, current_state, centers, angles);

%STD error
STD = std(angles(1, :), states_sequence(1, :));

%%
%State plot
createFigure;
plot(angles(1, :), angles(2, :),'b.');
hold on
plot(states_sequence(1, :), states_sequence(2, :),'r.');
title('Gait');
legend('Original data','Predicted data');
grid on;

createFigure;
plot(array(3, :), array(1, :),'b');
hold on;
plot(array(3, :), states_sequence(1, :),'r');
 xlim ([446 456]);
%  ylim ([-0.1 1.1]);
title('Gait (partition)');
legend('Original data','Predicted data');
grid on;


createFigure;
hold on;
plot(array(3, :), array(1, :), 'b');
title('Gait knee angle data');
grid on;

createFigure;
hold on;
plot(array(3, :), states_sequence(1, :), 'r');
title('Gait knee angle prediction');
grid on;