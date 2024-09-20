clear
clc

%dataNames = {"1","2o5","5","7o5", "10","15", "20", "5v2"};
dataNames = {"5","5v2"};

volume = pi * 0.5^2 * 4/3; % mL %% volume cylinder + volume cone

flowrates =[0.5 1 2.5 5 7.5 10 15 20] /60 ; % ml/s

dnozzle  = 1.5 / 1000;                              % mm
density  = 1049 * 1000;                             % kg/m^3
velocity = flowrates * 1e-6 / (pi * (dnozzle/2)^2); % m/s
dynamicViscosity = 75/1000;                         % kg/(ms)

Re = density * velocity * dnozzle / dynamicViscosity;

% Print statement
fprintf('At each flowrate \n Q = [%s] ml/min has a Reynolds number \n Re = [%s]\n', ...
    num2str(flowrates*60, '%.1f '), num2str(Re, '%.1f '));

for nDatasets = 1:length(dataNames)


    % Definition of the output
    N_colori=4 ;
    ccolor=colormap(brewermap([N_colori],"*RdBu")); % define the colorbar (and the number is the number of data)
    ccolor2=colormap(brewermap([10],"*RdBu")); % define the colorbar (and the number is the number of data)
    Size_Marker=10; % size of the marker
    Size_Marker2=6; % size of the marker
    SizeLine=1.5;


    %%%%%%%%%%%%%%%%%%%% FIBERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 50um diameter fiber and 1 mm long


    %%%%%%%%%%%%%%%%%%%% Nozzle %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % diameter 1.5 mm

    t_clog_phi_30_1  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_1mlMin');
    t_clog_phi_30_1(t_clog_phi_30_1 < 2.1 | t_clog_phi_30_1 > 1000) = [97.6];
    t_clog_phi_30_1 = t_clog_phi_30_1.';

    t_clog_phi_30_2o5 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_2o5mlMin');
    
    t_clog_phi_30_2o5(t_clog_phi_30_2o5 < 5.1 | t_clog_phi_30_2o5 > 1000) = [];
    t_clog_phi_30_2o5 = t_clog_phi_30_2o5.';

    t_clog_phi_30_5   = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_5mlMin');
    
    t_clog_phi_30_5(t_clog_phi_30_5 < 2.1 | t_clog_phi_30_5 > 1000) = [];
    t_clog_phi_30_5 = t_clog_phi_30_5.';

    t_clog_phi_30_5v2   = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30v2_ts500_5mlMin');
    
    t_clog_phi_30_5v2(t_clog_phi_30_5v2 < 2.1 | t_clog_phi_30_5v2 > 1000) = [];
    t_clog_phi_30_5v2 = t_clog_phi_30_5v2.';

    t_clog_phi_30_7o5 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_7o5mlMin');
    
    t_clog_phi_30_7o5(t_clog_phi_30_7o5 < 1.1 | t_clog_phi_30_7o5 > 1000) = [];
    t_clog_phi_30_7o5 = t_clog_phi_30_7o5.';


    t_clog_phi_30_10  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_10mlMin');
    t_clog_phi_30_10(t_clog_phi_30_10 < 1.1 | t_clog_phi_30_10 > 1000) = [];
    t_clog_phi_30_10 = t_clog_phi_30_10.';

    t_clog_phi_30_15  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_15mlMin');
    t_clog_phi_30_15(t_clog_phi_30_15 < 2.1 | t_clog_phi_30_15 > 1000) = [];
    t_clog_phi_30_15 = t_clog_phi_30_15.';

    t_clog_phi_30_15v2  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30v2_ts500_15mlMin');
    t_clog_phi_30_15v2(t_clog_phi_30_15v2 < 2.1 | t_clog_phi_30_15v2 > 1000) = [];
    t_clog_phi_30_15v2 = t_clog_phi_30_15v2.';

    t_clog_phi_30_20  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_20mlMin');
    t_clog_phi_30_20(t_clog_phi_30_20 < 2.1 | t_clog_phi_30_20 > 1000) = [];
    t_clog_phi_30_20 = t_clog_phi_30_20.';



    axis_phi_30_1   = [0, 10, 0, 150];
    axis_phi_30_2o5 = [0, 50, 0, 80];
    axis_phi_30_5   = [0, 50, 0, 40];
    axis_phi_30_5v2 = [0, 50, 0, 80];
    axis_phi_30_7o5 = [0, 50, 0, 25];
    axis_phi_30_10  = [0, 50, 0, 30];
    axis_phi_30_15  = [0, 75, 0, 40];
    axis_phi_30_20  = [0, 50, 0, 40];
    

    figtix = nDatasets+1;

    % Dynamically change which variables to use based on `nDatasets`

    if contains(dataNames{nDatasets}, '2o5')
        showThisData  = t_clog_phi_30_2o5;  % Assuming t_clog_phi_30_2o5 exists
        useThisAxis   = axis_phi_30_2o5;    % Assuming axis_phi_30_2o5 exists
        showThisTitle = 'Q = 2.5 ml/min';
    elseif contains(dataNames{nDatasets}, '7o5')
        showThisData  = t_clog_phi_30_7o5;  % Assuming t_clog_phi_30_7o5 exists
        useThisAxis   = axis_phi_30_7o5;    % Assuming axis_phi_30_7o5 exists
        showThisTitle = 'Q = 7.5 ml/min';
    elseif contains(dataNames{nDatasets}, '10v2')
        showThisData  = t_clog_phi_30_10v2;   % Assuming t_clog_phi_30_10 exists
        useThisAxis   = axis_phi_30_10v2;     % Assuming axis_phi_30_10 exists
        showThisTitle = 'Q v2 = 10 ml/min';
    elseif contains(dataNames{nDatasets}, '10')
        showThisData  = t_clog_phi_30_10;   % Assuming t_clog_phi_30_10 exists
        useThisAxis   = axis_phi_30_10;     % Assuming axis_phi_30_10 exists
        showThisTitle = 'Q = 10 ml/min';
    elseif contains(dataNames{nDatasets}, '15v2')
        showThisData  = t_clog_phi_30_15v2;   % Assuming t_clog_phi_30_15 exists
        useThisAxis   = axis_phi_30_15v2;     % Assuming axis_phi_30_15 exists
        showThisTitle = 'Q v2 = 15 ml/min';
    elseif contains(dataNames{nDatasets}, '15')
        showThisData  = t_clog_phi_30_15;   % Assuming t_clog_phi_30_15 exists
        useThisAxis   = axis_phi_30_15;     % Assuming axis_phi_30_15 exists
        showThisTitle = 'Q = 15 ml/min';
    elseif contains(dataNames{nDatasets}, '5v2')
        showThisData  = t_clog_phi_30_5v2;    % Assuming t_clog_phi_30_5 exists
        useThisAxis   = axis_phi_30_5v2;      % Assuming axis_phi_30_5 exists
        showThisTitle = 'Q v2 = 5 ml/min';
    elseif contains(dataNames{nDatasets}, '5')
        showThisData  = t_clog_phi_30_5;    % Assuming t_clog_phi_30_5 exists
        useThisAxis   = axis_phi_30_5;      % Assuming axis_phi_30_5 exists
        showThisTitle = 'Q = 5 ml/min';
    elseif contains(dataNames{nDatasets}, '20')
        showThisData  = t_clog_phi_30_20;   % Assuming t_clog_phi_30_20 exists
        useThisAxis   = axis_phi_30_20;     % Assuming axis_phi_30_20 exists
        showThisTitle = 'Q = 20 ml/min';
    elseif contains(dataNames{nDatasets}, '1')
        showThisData  = t_clog_phi_30_1;   % Assuming t_clog_phi_30_20 exists
        useThisAxis   = axis_phi_30_1;     % Assuming axis_phi_30_20 exists
        showThisTitle = 'Q = 20 ml/min';
    else
        error('Unknown dataset label');
    end
    




    %plot once only
    if nDatasets == 1
        %%%%%%%%%%%%% Average Value %%%%%%%%%%%%%%%
        Qvals=[1 2.5 5 7.5 10 15 20];

        mean_t_clog=[mean(t_clog_phi_30_1) mean(t_clog_phi_30_2o5), mean(t_clog_phi_30_5), mean(t_clog_phi_30_7o5), mean(t_clog_phi_30_10), mean(t_clog_phi_30_15), mean(t_clog_phi_30_20)];

        Qvalsv2=[5 15];

        mean_t_clogv2=[mean(t_clog_phi_30_5v2) mean(t_clog_phi_30_15v2)];

        figure(1)
        hold on

        yyaxis left
        plot(Qvals,mean_t_clog,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
        plot(Qvals,mean_t_clog,'--','Color',ccolor(1,:))
        plot(Qvalsv2,mean_t_clogv2,'o','MarkerFaceColor',[0 1 1],'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
        plot(Qvalsv2,mean_t_clogv2,'--','Color',[0 1 1])
        axis([0 Qvals(end) + Qvals(1) 0 120])
        xlabel('$Q(\frac{ml}{min})$','Interpreter','latex')
        ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
        set(gca,'FontSize',20)


        %%%%%%%  Average Volume %%%%%%%%%%%%%%%
        Q=0.5; %Flow rate in mL/min
        Q_s=Q./60; %Flow rate in mL/s
        yyaxis right
        hold on
        plot(Qvals,mean_t_clog.*Qvals/60,'o','MarkerFaceColor',ccolor(4,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
        plot(Qvals,mean_t_clog.*Qvals/60,'--','Color',ccolor(4,:))
        plot(Qvalsv2,mean_t_clogv2.*Qvalsv2/60,'o','MarkerFaceColor',[1 0.4 0.4],'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
        plot(Qvalsv2,mean_t_clogv2.*Qvalsv2/60,'--','Color',[1 0.4 0.4])
        ylabel('$\langle Q_{\rm clog} \rangle$ (mL)','Interpreter','latex')
        ylim([0 12])
        title('Average Extrusion Until Clog')
        pause(30)
    end

    %%%%%%%%%%%%%  Moving Average %%%%%%%%%%%%%%%
    %%%% phi=10%
    %showThisData = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    for i=1:size(showThisData,2)
        Mov_t_clog_10(i)=mean(showThisData(1:i));
        N_i(i)=i;
    end

    figure(figtix+1)
    subplot(2,2,1)
    plot(N_i,Mov_t_clog_10,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    axis(useThisAxis)
    xlabel('$\#$Experiments','Interpreter','latex')
    ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
    set(gca,'FontSize',20)

    %%% Define mean values and std
    t_10=mean(Mov_t_clog_10(end-5:end));
    std_t_10=std(Mov_t_clog_10(end-5:end));
    hold on
    plot([0 100],[t_10 t_10],'k','LineWidth',1.5)
    plot([0 100],[t_10-std_t_10 t_10-std_t_10],'k--','LineWidth',1)
    plot([0 100],[t_10+std_t_10 t_10+std_t_10],'k--','LineWidth',1)
    title(showThisTitle)

    %%%%%%%%%%%%%  Distribution %%%%%%%%%%%%%%%
    %%%% phi=10%
    %showThisData = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    figure(figtix+1)
    subplot(2,2,2)
    h_10=histogram(showThisData,6,'Normalization', 'probability');
    x=h_10.BinEdges(1:end-1)+h_10.BinWidth./2;
    y=h_10.Values;
    axis([0 x(end)*1.2 0 1])
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    title(showThisTitle)

    %%%% Fit Data
    yy = log(y);
    x  = x(isfinite(yy));
    y  = y(isfinite(yy));
    yy = yy(isfinite(yy));


    figure(figtix+1)
    subplot(2,2,3)
    plot(x,y,'o','MarkerFaceColor',ccolor(2,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    hold on
    s     = mean(showThisData);
    x_fit = 0:1:2000;
    loglog(x_fit,exp(-x_fit./s),'--','Color', ccolor(2,:),'linewidth',SizeLine)
    set(gca,'yscale','log');
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    axis([0 x(end)*1.2 1e-2 1])
    title(showThisTitle)



    %%%%% Try different order randomly

    %showThisData = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    t1=showThisData(randperm(length(showThisData)));
    t2=showThisData(randperm(length(showThisData)));
    t3=showThisData(randperm(length(showThisData)));
    t4=showThisData(randperm(length(showThisData)));
    t5=showThisData(randperm(length(showThisData)));
    t6=showThisData(randperm(length(showThisData)));
    t7=showThisData(randperm(length(showThisData)));
    t8=showThisData(randperm(length(showThisData)));
    t9=showThisData(randperm(length(showThisData)));


    for i=1:size(showThisData,2)
    Mov_t_clog_10(i)=mean(showThisData(1:i));
    Mov_t1(i)=mean(t1(1:i));
    Mov_t2(i)=mean(t2(1:i));
    Mov_t3(i)=mean(t3(1:i));
    Mov_t4(i)=mean(t4(1:i));
    Mov_t5(i)=mean(t5(1:i));
    Mov_t6(i)=mean(t6(1:i));
    Mov_t7(i)=mean(t7(1:i));
    Mov_t8(i)=mean(t8(1:i));
    Mov_t9(i)=mean(t9(1:i));
    N_i(i)=i;
    end

    figure(figtix+1)
    subplot(2,2,4)
    plot(N_i,Mov_t_clog_10,'o','MarkerFaceColor',ccolor2(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    hold on
    plot(N_i,Mov_t1,'o','MarkerFaceColor',ccolor2(2,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t2,'o','MarkerFaceColor',ccolor2(3,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t3,'o','MarkerFaceColor',ccolor2(4,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t4,'o','MarkerFaceColor',ccolor2(5,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t5,'o','MarkerFaceColor',ccolor2(6,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t6,'o','MarkerFaceColor',ccolor2(7,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t7,'o','MarkerFaceColor',ccolor2(8,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t8,'o','MarkerFaceColor',ccolor2(9,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)
    plot(N_i,Mov_t9,'o','MarkerFaceColor',ccolor2(10,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker2)


    axis(useThisAxis)
    xlabel('$\#$Experiments','Interpreter','latex')
    ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    title(showThisTitle)


    %%%%%%%% GENERATE LARGE NUMBER OR RANDOM VALUES

    N=10000;
    for j=1:N
    for i=1:size(showThisData,2)
    t1=showThisData(randperm(length(showThisData)));
    Mov_t(i,j)=mean(t1(1:i));
    end
    end

    for i=1:size(showThisData,2)
    Max_Mov_t(i)=max(Mov_t(i,:));
    Min_Mov_t(i)=min(Mov_t(i,:));
    Mean_Mov_t(i)=mean(Mov_t(i,:));
    STD_Mov_t(i)=std(Mov_t(i,:));
    end

    figure(figtix+1)
    plot(N_i,Mean_Mov_t,'k-','linewidth',SizeLine)
    hold on
    plot(N_i,Max_Mov_t,'k-.','linewidth',SizeLine)
    plot(N_i,Min_Mov_t,'k-.','linewidth',SizeLine)

    curve1 = Mean_Mov_t-STD_Mov_t;
    curve2 = Mean_Mov_t+STD_Mov_t;

    x_N_i = [N_i, fliplr(N_i)];
    inBetween = [curve1, fliplr(curve2)];
    cmap = [0.85 0.85 0.85];
    cmap2 = [0.4 0.4 0.4];
    h=fill(x_N_i, inBetween, cmap(1,:),'LineStyle','none');
    set(h,'facealpha',.4)

    hold on
    axis(useThisAxis)
    xlabel('$\#$Experiments','Interpreter','latex')
    ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    title(showThisTitle)





    % %% Look at histogram
    % N_2_5 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];
    % 
    %  for i=1:10
    %  [counts, edges] = histcounts(N_2_5,i+2,'Normalization','probability');
    %  x=edges(1:end-1)+(edges(2)-edges(1))./2;
    %  y=counts;
    %  yy=log(counts);
    % 
    %  x=x(isfinite(yy));
    %  y = y(isfinite(yy));
    %  yy = yy(isfinite(yy));
    % 
    % 
    %  [F0, G0] = fit(x',yy','poly1');
    %  [F1, G1] = fit(x(2:end)',yy(2:end)','poly1');
    %  R0(i)=G0.rsquare;
    %  a0(i)=F0.p1;
    %  b0(i)=F0.p2;
    %  R1(i)=G1.rsquare;
    %  a1(i)=F1.p1;
    %  b1(i)=F1.p2;
    % % 
    %  end
    %  figure(figtix+100)
    %  plot(R0,'ro')
    %  hold on
    %  plot(R1,'bo')

    clear

    dataNames = {"5","5v2"};
end