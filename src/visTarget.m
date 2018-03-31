function visTarget(x_c, theta1, theta2, x_0)

if ~exist('x_0', 'var')
    x_0 = [0, 0, 0]';
end

P = simClawArm(theta1, theta2, x_0);

plot3([P(1,3), x_c(1)], [P(2,3), x_c(2)], [P(3,3), x_c(3)], '--');

end
