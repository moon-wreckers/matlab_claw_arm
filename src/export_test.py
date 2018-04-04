import numpy as np

def sin(x):
    return np.sin(x)


def cos(x):
    return np.cos(x)


def conj(x):
    return np.conj(x)


def calc_d_theta1(theta1, theta2, x_c_x, x_c_y, x_c_z):
    d_theta1 = - (((31*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 - (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((93*cos(theta1)*sin(theta2))/4000 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 - (((31*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((93*sin(theta1)*sin(theta2))/4000 + (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((93*cos(conj(theta1))*sin(conj(theta2)))/4000 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((31*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 - (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((93*sin(conj(theta1))*sin(conj(theta2)))/4000 + (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 + (31*cos(theta2)*sin(theta1)*((3*cos(theta1))/40 + conj(x_c_y)))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 + (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_y + (3*cos(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2

    return d_theta1


def calc_d_theta2(theta1, theta2, x_c_x, x_c_y, x_c_z):
    d_theta2 = (((31*cos(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 + (31*cos(conj(theta1))*sin(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 - (31*cos(theta1)*cos(theta2)*(conj(x_c_z) - 9/100))/100))/2 + (((31*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100 - (31*cos(conj(theta1))*cos(conj(theta2))*(x_c_z - 9/100))/100)*((31*cos(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100 + (31*cos(theta1)*sin(theta2)*(conj(x_c_z) - 9/100))/100))/2 + (((31*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 + (31*sin(conj(theta1))*sin(conj(theta2))*(x_c_z - 9/100))/100)*((31*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_z) - 9/100))/100))/2 + (((31*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_z - 9/100))/100)*((31*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 + (31*sin(theta1)*sin(theta2)*(conj(x_c_z) - 9/100))/100))/2 - (((31*cos(conj(theta1))*cos(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*cos(conj(theta2))*sin(conj(theta1))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*sin(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*sin(theta1)*sin(theta2)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2 - (((31*cos(conj(theta1))*sin(conj(theta2))*(x_c_y + (3*cos(conj(theta1)))/40))/100 - (31*sin(conj(theta1))*sin(conj(theta2))*(x_c_x - (3*sin(conj(theta1)))/40))/100)*((31*cos(theta1)*cos(theta2)*((3*cos(theta1))/40 + conj(x_c_y)))/100 - (31*cos(theta2)*sin(theta1)*(conj(x_c_x) - (3*sin(theta1))/40))/100))/2

    return d_theta2


def main():
    theta = np.array([0, 0])
    x_c = np.array([1, 0, 0])

    update_alpha = 0.5

    print(theta)
    for i in range(1000):
        d_theta1 = calc_d_theta1(theta[0], theta[1], x_c[0], x_c[1], x_c[2])
        d_theta2 = calc_d_theta2(theta[0], theta[1], x_c[0], x_c[1], x_c[2])
        d_theta = np.array([d_theta1, d_theta2])
        theta = theta - update_alpha * d_theta
        print(theta)


if __name__ == '__main__':
    main()
