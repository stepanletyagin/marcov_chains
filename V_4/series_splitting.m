function [series] = series_splitting(values)

%Finding limits indeces
index = series_splitting_index(values(end, :));

n = length(index);
series = cell(1, n - 1); %Cell array of series

for i = 2:n
        temp = values(:, [index(i - 1) : index(i) - 1]);
        series{1, i - 1} = temp;
end

end