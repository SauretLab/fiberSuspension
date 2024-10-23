close
clear

%subplot(2,1,1)
T = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_d_1o5mm(x4)_phi_35_ts500at60_ts250at40_7o5mlMin_oct21');

hold on
i = (1:length(T));

plot(i,T)
plot(i, mean(T)*ones(length(T)), "LineStyle", '--', 'Color', [1 0 1])
title('bidisp: 60% 500um, 40% 250um, total 35% solid, 65% fluid')
xlabel('nth point')
ylabel('times')
legend('data','avg')

% subplot(2,1,2)
% T1 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_d_1o5mm(d)_phi_35_ts500_7o5mlMin_sept24');

% hold on
% i = (1:length(T1));

% plot(i,T1)
% plot(i, mean(T1)*ones(length(T1)), "LineStyle", '--', 'Color', [1 0 1])
% title('phi 35%')
% xlabel('nth point')
% ylabel('times')

% legend('data','avg')