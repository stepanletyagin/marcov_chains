function [next_state_location] = find_next_state(next_state)

%Hypercube side
delta_x = (x_max - x_min)/x_state_limit;
delta_y = (y_max - y_min)/y_state_limit;

x_min_temp = x_min; %Current state x_min
x_max_temp = x_min + delta_x; %Current state x_max

y_min_temp = y_max - delta_y; %Current state y_min
y_max_temp = y_max; %Current state y_max

next_state_location = [ ; ];

x = next_state(1, 1);
y = next_state(2, 1);

for i = 1:y_state_limit %State rows
    for j = 1:x_state_limit %State columns
            if ((x > x_min_temp) && (x < x_max_temp) && (y > y_min_temp) && (y < y_max_temp))
                next_state_location = [i; j];
                return;
            end
        x_min_temp = x_max_temp; %Changing the x limit
        x_max_temp = x_max_temp + delta_x; 
    end
   y_max_temp = y_min_temp; %Changing the row 
   y_min_temp = y_min_temp - delta_y;
   x_min_temp = x_min;
   x_max_temp = x_min + delta_x;
end

end