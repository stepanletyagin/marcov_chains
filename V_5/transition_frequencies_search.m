function [frequencies] = transition_frequencies_search(states, data_set)

frequencies = []; % Frequency cell array

for i = 1:size(states, 1)
    for j = 1:size(states, 2)
        frequencies_current = zeros(size(states, 1), size(states, 2));
        if (~isempty(states{i, j}))
            sorted_data = unique(states{i, j}.','rows', 'stable').' ; % Sorted array of each "square" state
            for k = 1:size(sorted_data, 2)
                index_next_cur = find((data_set(1, :) == sorted_data(1, k)) & (data_set(2, :) == sorted_data(2, k))) + 1; %Next state of each sorted value
                if (index_next_cur(end) == (length(data_set) + 1)) %Checking for last element
                    index_next_cur(end) = [];
                end
                for n = 1:size(states, 1) %Search for next state
                    for m = 1:size(states, 2)
                        if (~isempty(states{n, m}))
                            for q = 1:size(index_next_cur, 2)
%                                 if (index_next_cur(end) == (length(data_set) + 1))
%                                 frequencies_current(n, m) = frequencies_current(n, m) + 1;
%                                 break
                                if (sum(states{n, m}(1, :) == data_set(1, index_next_cur(q)) & states{n, m}(2, :) == data_set(2, index_next_cur(q))) > 0)
                                frequencies_current(n, m) = frequencies_current(n, m) + 1;
                                end
                            end
                        end
                    end
                end
            end
        end
        frequencies{i, j} = frequencies_current; 
    end
end

end