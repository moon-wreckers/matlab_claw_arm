function [d_theta1, d_theta2] = pdirControl(theta1_val, theta2_val, x_c_val)

if ~exist('x_c_val', 'var')
    x_c_val = [1,1,1]';
end

syms theta1 theta2 x_c_x x_c_y x_c_z;
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

% d_theta=
%                                                                           - (((31*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 - (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((93*cos(theta1)*sin(theta2))/4000 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 - (((31*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((93*sin(theta1)*sin(theta2))/4000 + (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((93*cos(conj(theta1))*sin(conj(theta2)))/4000 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((31*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 - (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((93*sin(conj(theta1))*sin(conj(theta2)))/4000 + (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 + (31*cos(theta2)*sin(theta1)*((3*cos(theta1))/40 + conj(x_c_y)))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 + (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_y + (3*cos(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2
% (((31*cos(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 + (31*cos(conj(theta1))*sin(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 - (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 + (((31*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 - (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((31*cos(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 + (31*cos(theta1)*sin(theta2)*(conj(x_c_z) - 9/100))/100))/2 + (((31*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 + (31*sin(conj(theta1))*sin(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 + (((31*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((31*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 + (31*sin(theta1)*sin(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*sin(theta1)*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2 - (((31*cos(conj(theta1))*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*sin(conj(theta1))*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2

theta1 = theta1_val;
theta2 = theta2_val;
x_c_x = x_c_val(1);
x_c_y = x_c_val(2);
x_c_z = x_c_val(3);
d_theta_val = double(subs(d_theta));

d_theta1 = d_theta_val(1);
d_theta2 = d_theta_val(2);

end
