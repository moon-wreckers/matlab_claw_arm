function [d_theta1, d_theta2] = pdirControl(theta1_val, theta2_val, x_c_val)

if ~exist('x_c_val', 'var')
    x_c_val = [1,1,1]';
end

syms theta1 theta2 x_c_x x_c_y x_c_z;
assume(theta1, 'real');
assume(theta2, 'real');
assume(x_c_x, 'real');
assume(x_c_y, 'real');
assume(x_c_z, 'real');

x_c = [x_c_x, x_c_y, x_c_z]';

P = simClawArm(theta1, theta2);

x_0 = P(1:3,1);
x_1 = P(1:3,3);
x_e = P(1:3,4);

dir_e = (x_e - x_1);
dir_c = (x_c - x_1);

loss = cross(dir_e, dir_c)' * cross(dir_e, dir_c) / 2;

d_theta = [diff(loss, theta1);
           diff(loss, theta2)];

d_theta = simplify(d_theta);

% d_theta=
% - ((31*sin(theta2)*(x_c_y + (3*cos(theta1))/40))/100 - cos(theta2)*sin(theta1)*((31*x_c_z)/100 - 279/10000))*((93*sin(theta1)*sin(theta2))/4000 - (279*cos(theta1)*cos(theta2))/10000 + (31*x_c_z*cos(theta1)*cos(theta2))/100) - ((31*sin(theta2)*(x_c_x - (3*sin(theta1))/40))/100 - cos(theta1)*cos(theta2)*((31*x_c_z)/100 - 279/10000))*((93*cos(theta1)*sin(theta2))/4000 + (279*cos(theta2)*sin(theta1))/10000 - (31*x_c_z*cos(theta2)*sin(theta1))/100) - (961*cos(theta2)^2*(x_c_x*cos(theta1) + x_c_y*sin(theta1))*(40*x_c_y*cos(theta1) - 40*x_c_x*sin(theta1) + 3))/400000
%                                             ((31*cos(theta2)*(x_c_x - (3*sin(theta1))/40))/100 + cos(theta1)*sin(theta2)*((31*x_c_z)/100 - 279/10000))*((31*sin(theta2)*(x_c_x - (3*sin(theta1))/40))/100 - cos(theta1)*cos(theta2)*((31*x_c_z)/100 - 279/10000)) + ((31*cos(theta2)*(x_c_y + (3*cos(theta1))/40))/100 + sin(theta1)*sin(theta2)*((31*x_c_z)/100 - 279/10000))*((31*sin(theta2)*(x_c_y + (3*cos(theta1))/40))/100 - cos(theta2)*sin(theta1)*((31*x_c_z)/100 - 279/10000)) - (961*cos(theta2)*sin(theta2)*(40*x_c_y*cos(theta1) - 40*x_c_x*sin(theta1) + 3)^2)/16000000

theta1 = theta1_val;
theta2 = theta2_val;
x_c_x = x_c_val(1);
x_c_y = x_c_val(2);
x_c_z = x_c_val(3);
d_theta_val = double(subs(d_theta));

d_theta1 = d_theta_val(1);
d_theta2 = d_theta_val(2);

end
