function [n] = find_state(centers, current_state)

delta_x = (centers{1, 2}(1, 1) - centers{1, 1}(1, 1)) / 2;
delta_y = (centers{1, 1}(2, 1) - centers{2, 1}(2, 1)) / 2;

centers = reshape(centers.', 1, []);

for i = 1:length(centers) %Search for next state
      if ((current_state(1, 1) >= (centers{1, i}(1, 1) - delta_x)) && (current_state(1, 1) <= (centers{1, i}(1, 1) + delta_x)) && (current_state(2, 1) >= (centers{1, i}(2, 1) - delta_y)) && (current_state(2, 1) <= (centers{1, i}(2, 1) + delta_y)))
      n = i;
      break  
      end
end

end