function [states] = create_states(series, x_state_limit, y_state_limit, x_min, x_max, y_min, y_max)

%Hypercube side
delta_x = (x_max - x_min)/x_state_limit;
delta_y = (y_max - y_min)/y_state_limit;

x_min_temp = x_min; %Current state x_min
x_max_temp = x_min + delta_x; %Current state x_max

y_min_temp = y_max - delta_y; %Current state y_min
y_max_temp = y_max; %Current state y_max

%Cell array of states
states = cell(x_state_limit, y_state_limit);

temp_value = [ ; ];

for n = 1:length(series) %Time series cycle
data_first = series{1, n}(7, :); %First angle values
data_second = series{1, n}(8, :); %First angle values
for i = 1:x_state_limit %State rows
    for j = 1:y_state_limit %State columns
        for k = 1:length(data_first) %Checking values for getting into the state
            if ((data_first(1, k) > x_min_temp) && (data_first(1, k) < x_max_temp) && (data_second(1, k) > y_min_temp) && (data_second(1, k) < y_max_temp))
                temp_value(1, 1) = data_first(1, k);
                temp_value(2, 1) = data_second(1, k);
                states{i, j} = [states{i, j} temp_value];
            end
        end
        x_min_temp = x_max_temp; %Changing the x limit
        x_max_temp = x_max_temp + delta_x; 
    end
   y_max_temp = y_min_temp; %Changing the row 
   y_min_temp = y_min_temp - delta_y;
   x_min_temp = x_min;
   x_max_temp = x_min + delta_x;
end
x_min_temp = x_min; %Current state x_min
x_max_temp = x_min + delta_x; %Current state x_max

y_min_temp = y_max - delta_y; %Current state y_min
y_max_temp = y_max; %Current state y_max
end %End of time series cycle

end
  