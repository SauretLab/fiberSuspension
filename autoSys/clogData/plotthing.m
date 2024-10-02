close
clear

subplot(2,1,1)
T = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_d_1o5mm(d)_phi_25_ts500_7o5mlMin_sept24');

hold on
i = (1:length(T));

plot(i,T)
plot(i, mean(T)*ones(length(T)), "LineStyle", '--', 'Color', [1 0 1])
title('phi 25%')
xlabel('nth point')
ylabel('times')
legend('data','avg')

subplot(2,1,2)
T1 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_d_1o5mm(d)_phi_35_ts500_7o5mlMin_sept24');

hold on
i = (1:length(T1));

plot(i,T1)
plot(i, mean(T1)*ones(length(T1)), "LineStyle", '--', 'Color', [1 0 1])
title('phi 35%')
xlabel('nth point')
ylabel('times')

legend('data','avg')