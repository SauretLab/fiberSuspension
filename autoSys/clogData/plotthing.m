T = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/lightSignal_phi_30_ts500_20mlMin');

hold on
i = (1:length(T))/4;

plot(i,T)

xlabel('time(s)')
ylabel('average brightness')

T = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/lightSignal_phi_30_ts500_2o5mlMin');

hold on
i = (1:length(T))/4;

plot(i,T)

xlabel('time(s)')
ylabel('average brightness')