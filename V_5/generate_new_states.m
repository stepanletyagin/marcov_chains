function [new_states_sequence] = generate_new_states(transit_matrix, current_state, centers, angles)

new_states_sequence = [];

centers_row = reshape(centers.', 1, []);

for i = 1:length(angles)
%     state_index = find_state(centers, current_state);
    current_state(1, 1) = angles(1, i);
    current_state(2, 1) = angles(2, i);
    state_index = find_state(centers, current_state);
    data_first = 0;
    data_second = 0;
    for j = 1:size(transit_matrix, 2)
        data_first_temp = transit_matrix(state_index, j) * centers_row{1, j}(1, 1);
        data_second_temp = transit_matrix(state_index, j) * centers_row{1, j}(2, 1);
        data_first = data_first + data_first_temp;
        data_second = data_second + data_second_temp;
    end
    current_state(1, 1) = data_first;
    current_state(2, 1) = data_second;
    new_states_sequence = [new_states_sequence current_state];
end 



% for i = 1:length(angles)
% %     state_index = find_state(centers, current_state);
%     current_state(1, 1) = angles(1, i);
%     current_state(2, 1) = angles(2, i);
%     state_index = find_state(centers, current_state);
%     if (sum(transit_matrix(state_index, :)) ~= 0)
%         data_first = 0;
%         data_second = 0;
%         for j = 1:size(transit_matrix, 2)
%             data_first_temp = transit_matrix(state_index, j) * centers_row{1, j}(1, 1);
%             data_second_temp = transit_matrix(state_index, j) * centers_row{1, j}(2, 1);
%             data_first = data_first + data_first_temp;
%             data_second = data_second + data_second_temp;
%         end
%         current_state(1, 1) = data_first;
%         current_state(2, 1) = data_second;
%         new_states_sequence = [new_states_sequence current_state];
%     end
% 
% end 

end