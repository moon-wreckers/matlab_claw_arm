import numpy as np

def sin(x):
    return np.sin(x)


def cos(x):
    return np.cos(x)


def conj(x):
    return np.conj(x)


def calc_d_theta1(theta1, theta2, x_c_x, x_c_y, x_c_z):
    d_theta1 = - ((31*sin(theta2)*(x_c_y + (3*cos(theta1))/40))/100 - cos(theta2)*sin(theta1)*((31*x_c_z)/100 - 279/10000))*((93*sin(theta1)*sin(theta2))/4000 - (279*cos(theta1)*cos(theta2))/10000 + (31*x_c_z*cos(theta1)*cos(theta2))/100) - ((31*sin(theta2)*(x_c_x - (3*sin(theta1))/40))/100 - cos(theta1)*cos(theta2)*((31*x_c_z)/100 - 279/10000))*((93*cos(theta1)*sin(theta2))/4000 + (279*cos(theta2)*sin(theta1))/10000 - (31*x_c_z*cos(theta2)*sin(theta1))/100) - (961*cos(theta2)**2*(x_c_x*cos(theta1) + x_c_y*sin(theta1))*(40*x_c_y*cos(theta1) - 40*x_c_x*sin(theta1) + 3))/400000

    return d_theta1


def calc_d_theta2(theta1, theta2, x_c_x, x_c_y, x_c_z):
    d_theta2 = ((31*cos(theta2)*(x_c_x - (3*sin(theta1))/40))/100 + cos(theta1)*sin(theta2)*((31*x_c_z)/100 - 279/10000))*((31*sin(theta2)*(x_c_x - (3*sin(theta1))/40))/100 - cos(theta1)*cos(theta2)*((31*x_c_z)/100 - 279/10000)) + ((31*cos(theta2)*(x_c_y + (3*cos(theta1))/40))/100 + sin(theta1)*sin(theta2)*((31*x_c_z)/100 - 279/10000))*((31*sin(theta2)*(x_c_y + (3*cos(theta1))/40))/100 - cos(theta2)*sin(theta1)*((31*x_c_z)/100 - 279/10000)) - (961*cos(theta2)*sin(theta2)*(40*x_c_y*cos(theta1) - 40*x_c_x*sin(theta1) + 3)**2)/16000000

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
