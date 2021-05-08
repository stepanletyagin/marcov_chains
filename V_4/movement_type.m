function [values] = movement_type(data_union, type)

data_union{2, 2}(1,2) = "Mmax";
data_union{2, 2}(2,2) = "ahip_max";
data_union{2, 2}(3,2) = "ahip_min";
data_union{2, 2}(4,2) = "aknee_max";
data_union{2, 2}(5,2) = "h";
data_union{2, 2}(6,2) = "wks_smoothed";
data_union{2, 2}(12,2) = "time";

vars_table = data_union{2, 2}; % Values
values = data_union{1, type}; % Movement type

% if values(:, 1) == 0
%     values (:, 1) = [];
% end

for i = 1:length(values) - 1 %Переделать удаление нулевого столбца!!!
    if values(:, i) == 0
        values(:, i) = [];
    end
end

for i = 1:length(vars_table)
    assignin('base', vars_table(i, 2), values(i, :)); %Assigning values
end

end