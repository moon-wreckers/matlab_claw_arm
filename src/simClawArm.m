function [P] = simClawArm(theta1, theta2, x_0)

if ~exist('x_0', 'var')
    x_0 = [0, 0, 0]';
end

H_0_A = [1, 0, 0, 0;
         0, 1, 0, 0;
         0, 0, 1, 0.09;
         0, 0, 0, 1];

H_A_B = [cos(theta1), -sin(theta1), 0, 0;
         sin(theta1),  cos(theta1), 0, 0;
                   0,            0, 1, 0;
                   0,            0, 0, 1];

H_B_C = [1, 0, 0, 0;
         0, 1, 0, -0.075;
         0, 0, 1, 0;
         0, 0, 0, 1];

H_C_1 = [cos(theta2), -sin(theta2),  0, 0;
                   0,            0, -1, 0;
         sin(theta2),  cos(theta2),  0, 0;
                   0,            0,  0, 1];

H_1_e = [1, 0, 0, 0.31;
         0, 1, 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];

H_0_B = H_0_A * H_A_B;
H_0_1 = H_0_B * H_B_C * H_C_1;
H_0_e = H_0_1 * H_1_e;

x0 = [x_0; 1];
xB = H_0_B * x0;
x1 = H_0_1 * x0;
xe = H_0_e * x0;

P = [x0, xB, x1, xe];

end
