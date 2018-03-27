x_c = [1,1,1]';

alpha = 0.5;
x_0 = [0, 0, 0]';

theta1 = 0;
theta2 = 0;

figure(1);
visClawArm(theta1, theta2, x_0, 5);

hold on;
for t = 1:100
    [d_theta1, d_theta2] = pdirControl(theta1, theta2, x_c);
    theta1 = theta1 - d_theta1 * alpha;
    theta2 = theta2 - d_theta2 * alpha;
    figure(1);
    visClawArm(theta1, theta2, x_0, 1);
end
visClawArm(theta1, theta2, x_0, 5);
hold off;
