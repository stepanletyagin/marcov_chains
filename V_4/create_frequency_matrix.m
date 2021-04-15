function [frequency_matrix] = create_frequency_matrix(frequency_cell)

for i = 1:size(frequency_cell, 1)
    for j = 1:size(frequency_cell, 2)
        frequency_cell{i, j} = reshape(frequency_cell{i, j}.', 1, []);
    end
end

frequency_matrix = [];
n = size(frequency_cell, 1) * size(frequency_cell, 2);
for i = 1:size(frequency_cell, 1)
    for j = 1:size(frequency_cell, 2)
        frequency_matrix = [frequency_matrix frequency_cell{i, j}(1, :)];
    end
end

frequency_matrix = reshape(frequency_matrix, n, n).';

end