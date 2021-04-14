function [states_sequence] = generate_states(transit_matrix, current_state, centers, x_state_limit, y_state_limit, x_min, x_max, y_min, y_max)

%Hypercube side
delta_x = (x_max - x_min)/x_state_limit;
delta_y = (y_max - y_min)/y_state_limit;

x_min_temp = x_min; %Current state x_min
x_max_temp = x_min + delta_x; %Current state x_max

y_min_temp = y_max - delta_y; %Current state y_min
y_max_temp = y_max; %Current state y_max

x = current_state(1, 1);
y = current_state(2, 1);

states_sequence_first = [];
states_sequence_second = [];

for i = 1:y_state_limit
    for j = 1:x_state_limit
        if ((x > x_min_temp) && (x < x_max_temp) && (y > y_min_temp) && (y < y_max_temp))
        states_sequence_first = [states_sequence_first (transit_matrix(i, j) * centers{i, j}(1, 1))];
        states_sequence_second = [states_sequence_second (transit_matrix(i, j) * centers{i, j}(2, 1))];
        x = states_sequence_first(1, end);
        y = states_sequence_second(1, end);
        else
        states_sequence_first = [states_sequence_first 0];
        states_sequence_second = [states_sequence_second 0];          
        end 
        x_min_temp = x_max_temp; %Changing the x limit
        x_max_temp = x_max_temp + delta_x; 
    end
y_max_temp = y_min_temp; %Changing the row 
y_min_temp = y_min_temp - delta_y;
x_min_temp = x_min;
x_max_temp = x_min + delta_x;
end
states_sequence = [states_sequence_first; states_sequence_second];
end