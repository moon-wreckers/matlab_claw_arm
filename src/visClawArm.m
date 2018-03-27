T = [0:0.01*pi:0.5*pi, 0.5*pi:-0.01*pi:0];

rounds = 3;
for i_round = 1:rounds
    for i_theta = 1:length(T)
        P = simClawArm(T(i_theta), T(i_theta));

        figure(1);
        plot3(P(1,:), P(2,:), P(3,:), 'LineWidth', 8);
        grid on;
        xlim([-0.1 0.5]);
        ylim([-0.1 0.5]);
        zlim([0 0.5]);
        xlabel('x');
        ylabel('y');
        zlabel('z');
        pause(0.01);
    end
end
