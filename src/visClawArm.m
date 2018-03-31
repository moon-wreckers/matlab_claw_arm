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
xlim([-0.4 0.4]);
ylim([-0.4 0.4]);
zlim([0 0.4]);
xlabel('x');
ylabel('y');
zlabel('z');

end
