function visClawArm(theta1, theta2, x_0, linewidth)

if ~exist('x_0', 'var')
    x_0 = [0, 0, 0]';
end

if ~exist('linewidth', 'var')
    linewidth = 8;
end

P = simClawArm(theta1, theta2, x_0);

plot3(P(1,:), P(2,:), P(3,:), 'LineWidth', linewidth);
grid on;
xlim([-0.1 0.5]);
ylim([-0.1 0.5]);
zlim([0 0.5]);
xlabel('x');
ylabel('y');
zlabel('z');

end
