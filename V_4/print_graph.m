function graph = print_graph(states_sequence, parametr)

createFigure;
hold on;
x = [0:0.01:((length(parametr)/100) - 0.01)];
plot(x, states_sequence, 'g');

x = [0:0.01:(length(parametr)/100) - 0.01];
plot(x, parametr, 'b');

title('Gait');
grid on;

% createFigure;
% stairs(states, 'LineWidth',2)
% set(gca, 'YGrid','on', 'YLim',[0 N+1])
% xlabel('time'), ylabel('states')
% title('sequence of states')

end