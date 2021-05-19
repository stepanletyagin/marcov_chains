function [std] = std(original_data, predicted_data)

std = 0;
for i = 1:length(predicted_data)
%     s1 = abs(array(1, i) - states_sequence(1, i)) / array(1, i) + s1;
      std = (original_data(1, i) - predicted_data(1, i))^2 + std;
        
end
% s1 = s1/length(states_sequence) * 100;
std = sqrt(std / length(predicted_data));

end