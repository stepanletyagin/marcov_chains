function [centers] = centers_search(x_state_limit, y_state_limit, x_min, x_max, y_min, y_max)

%Hypercube side
delta_x = (x_max - x_min)/x_state_limit;
delta_y = (y_max - y_min)/y_state_limit;

x_min_temp = x_min; %Current state x_min
x_max_temp = x_min + delta_x; %Current state x_max

y_min_temp = y_max - delta_y; %Current state y_min
y_max_temp = y_max; %Current state y_max

centers = cell(x_state_limit, y_state_limit);

for i = 1:y_state_limit
    for j = 1:x_state_limit
     centers{i, j}(1, 1) = x_min_temp + (x_max_temp - x_min_temp)/2;
     centers{i, j}(2, 1) = y_min_temp + (y_max_temp - y_min_temp)/2;
     x_min_temp = x_max_temp; %Changing the x limit
     x_max_temp = x_max_temp + delta_x; 
    end
y_max_temp = y_min_temp; %Changing the row 
y_min_temp = y_min_temp - delta_y;
x_min_temp = x_min;
x_max_temp = x_min + delta_x;
end

end