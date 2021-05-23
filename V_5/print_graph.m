function graph = print_graph(angles, states_sequence, movement_type)

createFigure;
plot(angles(1, :), angles(2, :),'b.');
hold on
plot(states_sequence(1, :), states_sequence(2, :),'r.');
title(movement_type);
legend('Original data','Predicted data');
grid on;

time = [0:0.1:length(states_sequence) / 10];
time(end) = [];

createFigure;
hold on;
plot(time, angles(2, :), 'b');
title('Fast gait hip angle data');
grid on;

createFigure;
hold on;
% plot(array(3, :), states_sequence(2, :), 'r');
plot(time, states_sequence(2, :), 'r');
title('Fast gait hip angle prediction');
grid on;

createFigure;
plot(time, angles(2, :),'b');
hold on;
plot(time, states_sequence(2, :),'r');
%  xlim ([-10 50]);
%  ylim ([-0.1 1.1]);
title(movement_type);
legend('Original data','Predicted data');
grid on;

end