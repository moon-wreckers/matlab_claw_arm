function runPDirControl(x_c, theta, alpha, x_0)

if ~exist('x_c', 'var')
    x_c = [1,1,1]';
end

if ~exist('alpha', 'var')
    alpha = 0.5;
end

if ~exist('x_0', 'var')
    x_0 = [0, 0, 0]';
end

if ~exist('theta', 'var')
    theta = [0, 0];
end
    
theta1 = theta(1);
theta2 = theta(2);

figure(1);
visClawArm(theta1, theta2, x_0, 5);
hold on;
visTarget(x_c, theta1, theta2, x_0);
hold off;

for t = 1:50
    [d_theta1, d_theta2] = pdirControl(theta1, theta2, x_c);
    theta1 = theta1 - d_theta1 * alpha;
    theta2 = theta2 - d_theta2 * alpha;
    fprintf('[theta1, theta2] = [%f, %f]\n', theta1, theta2);
    figure(1);
    visClawArm(theta1, theta2, x_0, 5);
    hold on;
    visTarget(x_c, theta1, theta2, x_0);
    visClawArm(theta1, theta2, x_0, 1);
    hold off;
end
visClawArm(theta1, theta2, x_0, 5);
hold on;
visTarget(x_c, theta1, theta2, x_0);
visClawArm(theta1, theta2, x_0, 1);
hold off;

end
