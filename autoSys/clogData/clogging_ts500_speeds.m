clear
clc

dataNames = {"2o5"};

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
    t_clog_phi_30_2o5 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_phi_30_ts500_2-5mlMin');
    
    t_clog_phi_30_2o5(t_clog_phi_30_2o5 < 5.1 | t_clog_phi_30_2o5 > 1000) = [];
    t_clog_phi_30_2o5 = t_clog_phi_30_2o5.';

    t_clog_phi_30_5   = [22, 24];
    t_clog_phi_30_7o5 = [26, 28];
    t_clog_phi_30_10  = [30, 32];
    t_clog_phi_30_15  = [34, 36];
    t_clog_phi_30_20  = [38, 40];
    



    axis_phi_30_2o5 = [0 50 0 100];
    axis_phi_10_old = [0 85 0 200];

    axis_phi_10_press = [0 150 0 150];

    axis_phi_5 = [0 100 0 150];
    axis_phi_10 = [0 85 0 100];

    axis_phi_5_600um = [0 50 0 500];
    axis_phi_10_600um = [0 210 0 200];
    axis_phi_20_600um = [0 210 0 200];
    axis_phi_20_600um_NF = [0 1050 0 200];

    axis_phi_1_old = [0 3 0 3000];
    axis_phi_1 = [0 20 0 300];

    figtix = (nDatasets - 1) * 5;

    % Dynamically change which variables to use based on `nDatasets`

    if contains(dataNames{nDatasets}, '2o5')
        showThisPhi = t_clog_phi_30_2o5;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_30_2o5;    % Assuming axis_phi_10 exists
        showThisTitle = 'Q = 2.5 ml/min';
    elseif contains(dataNames{nDatasets}, '10_old')
        showThisPhi = t_clog_phi_10_old;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10_old;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi old = 10%';    
    elseif contains(dataNames{nDatasets}, '10_press')
        showThisPhi = t_clog_phi_10_press;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10_press;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi prs = 10%';
    elseif contains(dataNames{nDatasets}, '5_600um')
        showThisPhi = t_clog_phi_5_600um;  % Assuming t_clog_phi_5 exists
        useThisAxis = axis_phi_5_600um;    % Assuming axis_phi_5 exists
        showThisTitle = 'phi viz = 5%, L600um';
    elseif contains(dataNames{nDatasets}, '10_600um')
        showThisPhi = t_clog_phi_10_600um;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10_600um;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz = 10%, L600um';
    elseif contains(dataNames{nDatasets}, '5')
        showThisPhi = t_clog_phi_5;  % Assuming t_clog_phi_5 exists
        useThisAxis = axis_phi_5;    % Assuming axis_phi_5 exists
        showThisTitle = 'phi viz = 5%';
    elseif contains(dataNames{nDatasets}, '10')
        showThisPhi = t_clog_phi_10;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz = 10%';
    elseif contains(dataNames{nDatasets}, '1_old')
        showThisPhi = t_clog_phi_1_old;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_1_old;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi old = 1%'; 
    elseif contains(dataNames{nDatasets}, '1')
        showThisPhi = t_clog_phi_1;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_1;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz = 1%'; 
    elseif contains(dataNames{nDatasets}, 'elephant')
        showThisPhi = t_clog_phi_20_600um_NF;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_20_600um_NF;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz no filter = 20%'; 
    elseif contains(dataNames{nDatasets}, '20_600um')
        showThisPhi = t_clog_phi_20_600um;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_20_600um;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz = 20%'; 
    end






    %%%%%%%%%%%%% Average Value %%%%%%%%%%%%%%%
    Qvals=[2.5 5 7.5 10 15 20];

    mean_t_clog=[mean(t_clog_phi_30_2o5), mean(t_clog_phi_30_5), mean(t_clog_phi_30_7o5), mean(t_clog_phi_30_10), mean(t_clog_phi_30_15), mean(t_clog_phi_30_20)];

    figure(figtix+1)
    subplot(2,2,1)
    yyaxis left
    plot(Qvals,mean_t_clog,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    axis([0 20 0 2000])
    xlabel('$Q(\frac{ml}{min})$','Interpreter','latex')
    ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
    set(gca,'FontSize',20)


    %%%%%%%  Average Volume %%%%%%%%%%%%%%%
    Q=0.5; %Flow rate in mL/min
    Q_s=Q./60; %Flow rate in mL/s
    yyaxis right
    plot(Qvals,mean_t_clog.*Q,'o','MarkerFaceColor',ccolor(4,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    ylabel('$\langle Q_{\rm clog} \rangle$ (mL)','Interpreter','latex')
    ylim([0 2000])
    title('Average Extrusion Until Clog')


    %%%%%%%%%%%%%  Moving Average %%%%%%%%%%%%%%%
    %%%% phi=10%
    %t_clog_phi_10 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    t_clog_phi_10 = showThisPhi;

    for i=1:size(t_clog_phi_10,2)
        Mov_t_clog_10(i)=mean(t_clog_phi_10(1:i));
        N_i(i)=i;
    end

    figure(figtix+1)
    subplot(2,2,2)
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
    %t_clog_phi_10 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    figure(figtix+1)
    subplot(2,2,3)
    h_10=histogram(t_clog_phi_10,6,'Normalization', 'probability');
    x=h_10.BinEdges(1:end-1)+h_10.BinWidth./2;
    y=h_10.Values;
    axis([0 x(end)*1.2 0 1])
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    title(showThisTitle)

    %%%% Fit Data
    yy=log(y);
    x=x(isfinite(yy));
    y = y(isfinite(yy));
    yy = yy(isfinite(yy));


    figure(figtix+1)
    subplot(2,2,4)
    plot(x,y,'o','MarkerFaceColor',ccolor(2,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    hold on
    s= mean(t_clog_phi_10);
    x_fit=0:1:2000;
    loglog(x_fit,exp(-x_fit./s),'--','Color', ccolor(2,:),'linewidth',SizeLine)
    set(gca,'yscale','log');
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    axis([0 x(end)*1.2 1e-2 1])
    title(showThisTitle)



    %%%%% Try different order randomly

    %t_clog_phi_10 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29];

    t1=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t2=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t3=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t4=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t5=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t6=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t7=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t8=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    t9=t_clog_phi_10(randperm(length(t_clog_phi_10)));


    for i=1:size(t_clog_phi_10,2)
    Mov_t_clog_10(i)=mean(t_clog_phi_10(1:i));
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

    figure(figtix+2)
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
    for i=1:size(t_clog_phi_10,2)
    t1=t_clog_phi_10(randperm(length(t_clog_phi_10)));
    Mov_t(i,j)=mean(t1(1:i));
    end
    end

    for i=1:size(t_clog_phi_10,2)
    Max_Mov_t(i)=max(Mov_t(i,:));
    Min_Mov_t(i)=min(Mov_t(i,:));
    Mean_Mov_t(i)=mean(Mov_t(i,:));
    STD_Mov_t(i)=std(Mov_t(i,:));
    end

    figure(figtix+2)
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

    dataNames = {"5_old", "10_old","10_press", "5_600um", "10_600um", "5", "10", "1_old","1","20_600um_NF","20_600um"};
end