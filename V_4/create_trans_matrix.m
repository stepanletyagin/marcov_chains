function [transition_matrix] = create_trans_matrix(states, frequency_matrix)

transition_matrix = []; %Transition matrix
points_num = []; %Number points in each state
dim = size(states, 1) * size(states, 2); %Size of transition matrix

for i = 1:size(states, 1)
    for j = 1:size(states, 2)
            points_num = [points_num length(states{i, j})];      
    end
end

for i = 1:dim
    for j = 1:dim
        if (points_num(i) == 0)
            transition_matrix(i, j) = 0;
        else
            transition_matrix(i, j) = frequency_matrix(i, j)/points_num(i);
        end
    end
end

end