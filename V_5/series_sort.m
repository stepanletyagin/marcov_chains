function [series] = series_sort(series)

for i = 1:length(series)
    for j = 1:(length(series) - i)
        if series{1, j}(3, 1) > series{1, j + 1}(3, 1)
          temp_cell = series{1, j}; 
          series{1, j} = series{1, j + 1}; 
          series{1, j + 1} = temp_cell;
        end   
    end
end

end
