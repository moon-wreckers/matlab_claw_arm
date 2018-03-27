T = [0:0.01*pi:0.5*pi, 0.5*pi:-0.01*pi:0];

rounds = 3;
for i_round = 1:rounds
    for i_theta = 1:length(T)
        figure(1);
        visClawArm(T(i_theta), T(i_theta));
        pause(0.01);
    end
end
