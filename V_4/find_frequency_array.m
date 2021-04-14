function [frequency_cell] = find_frequency_array(states, arr)

frequency_cell = [];
for i = 1:size(states, 1)
for j = 1:size(states, 2)
    frequencies = zeros(size(states, 1), size(states, 2));
    if (~isempty(states{i, j}))
    for k = 1:size(states{i, j}, 2)
        idx_current = find((arr(1, :) == states{i, j}(1, k)) & (arr(2, :) == states{i, j}(2, k)));
        for n = 1:size(states, 1)
            for m = 1:size(states, 2)
                if (~isempty(states{n, m}))
                        for q = 1:size(idx_current, 2)
                            if ((idx_current(q) + 1) < length(arr))
                            ind = find(states{n, m}(1, :)== arr(1, (idx_current(q) + 1)) & states{n, m}(2, :)== arr(2, (idx_current(q) + 1)));
                            if (ind ~= 0)
                                frequencies(n, m) = frequencies(n, m) + 1;
                                break
                            end
                            end
                    end
                end
            end
        end
    end
end
frequency_cell{i, j} = frequencies;
end
end

end