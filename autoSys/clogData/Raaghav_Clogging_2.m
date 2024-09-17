clear
clc

dataNames = {"5_old", "10_old","10_press", "5", "10"};

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

    %%%% phi=1%
    t_clog_phi_1 =[2041, 1819, 1251];

    t_clog_phi_5_old  = [2155, 370, 995, 617, 285, 1318, 223, 309, 166, 218, 740, 59, 703, 288, 168];

    %%%% phi=5%
    t_clog_phi_5  = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_image_phi_5_L1000um_d50um_a1-5mm_newShape');

    t_clog_phi_5(t_clog_phi_5 < 5.1 | t_clog_phi_5 > 300) = [];
    t_clog_phi_5 = t_clog_phi_5.';

    %%%% phi=10%
    t_clog_phi_10_old = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29, 94, 705, 264, 105, 66, 54, 277, 74, 104, 28, 39, 323, 124, 239, 59, 45, 181, 123, 28, 21, 101, 18, 52, 30, 16, 64, 87, 14, 29, 32, 133, 246, 55, 86, 100, 136, 98, 13, 48, 116, 32, 113, 82, 90, 120, 18, 29, 12, 27, 69, 154];

    t_clog_phi_10_press = [41.0028529, 69.7913668, 39.9546928, 21.6785698, 26.9255340, 25.8971140, 22.9721363, 26.7806001, 23.9270058, 54.8660641, ...
        51.5410330, 73.9961507, 22.2613370, 76.8098519, 142.2700160, 24.6574881, 47.9119070, 16.9454901, 61.8236270, 38.9782469, ...
        40.9455533, 35.9590478, 32.9582860, 20.9108460, 34.8772948, 9.6065221, 109.9922743, 19.9010229, 30.7990439, 35.8245020, ...
        64.6667614, 64.9140980, 50.3590081, 75.0437169, 37.8761430, 31.6290700, 53.9214306, 35.5583491, 58.9482400, 29.4557083, ...
        27.9395230, 33.7098129, 10.8998730, 19.8804121, 33.8101971, 39.7188818, 60.9403009, 114.4629781, 63.9540260, 19.8673859, ...
        12.7895081, 36.8694420, 35.5955100, 24.6637208, 20.7627459, 20.8647859, 43.9905972, 20.5705161, 46.0021160, 38.5681708, ...
        13.9386680, 47.8599761, 22.9028771, 58.7776513, 26.9285622, 45.9605920, 46.8744619, 35.8661640, 20.6683130, 106.0116441, ...
        21.8626220, 24.8520069, 29.7952790, 29.9299402, 23.9593170, 37.9074910, 52.9232931, 26.4661822, 47.04013419, 83.66720104, ...
        2.278149128, 30.09577703, 23.81430888, 23.78429198, 28.74348712, 36.61944985, 10.71866488, 9.949548006, 34.89774299, ...
        27.66141582, 47.79160023, 11.49138737, 11.91859102, 21.95494986, 16.7421279, 25.90397692, 31.70688701, 36.77038217, ...
        34.72303796, 29.65537, 37.73889494, 38.61679006, 34.64883494, 40.71240592, 32.61393595, 25.71736598, 47.7058301, ...
        19.65479589, 42.92983508, 23.73711681, 36.8922708, 27.69888616, 43.87270784, 66.69159508, 52.43215084, 94.67609715, ...
        41.21974111, 9.709201813, 10.95458388, 90.14696598, 58.16157699, 28.53161287, 31.90346289, 30.78291512, 38.82324004, ...
        53.06267691, 59.69433284, 12.45879412, 26.83559608, 39.69962287, 30.59814978, 29.682096, 67.72550106, 18.29495406, ...
        31.75058103, 9.838423729, 32.04068303, 21.7545619, 37.9710691, 55.73638415, 33.58265805, 20.61165118, 67.84744906, ...
        21.51108289, 21.51108289];
        
    
    t_clog_phi_10 = readmatrix('/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/fiber/autoSys/clogData/clogTimes_image_phi_10_L1000um_d50um_a1-5mm_newShape');

    t_clog_phi_10(t_clog_phi_10 < 5.1 | t_clog_phi_10 > 1000) = [];
    t_clog_phi_10 = t_clog_phi_10.';

    axis_phi_5_old = [0 20 0 2000];
    axis_phi_10_old = [0 85 0 200];

    axis_phi_10_press = [0 150 0 150];

    axis_phi_5 = [0 100 0 150];
    axis_phi_10 = [0 85 0 100];



    figtix = (nDatasets - 1) * 5;

    % Dynamically change which variables to use based on `nDatasets`

    if contains(dataNames{nDatasets}, '5_old')
        showThisPhi = t_clog_phi_5_old;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_5_old;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi old = 5%';

    elseif contains(dataNames{nDatasets}, '10_old')
        showThisPhi = t_clog_phi_10_old;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10_old;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi old = 10%';    
    elseif contains(dataNames{nDatasets}, '10_press')
        showThisPhi = t_clog_phi_10_press;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10_press;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi prs = 10%';
    elseif contains(dataNames{nDatasets}, '5')
        showThisPhi = t_clog_phi_5;  % Assuming t_clog_phi_5 exists
        useThisAxis = axis_phi_5;    % Assuming axis_phi_5 exists
        showThisTitle = 'phi viz = 5%';
    elseif contains(dataNames{nDatasets}, '10')
        showThisPhi = t_clog_phi_10;  % Assuming t_clog_phi_10 exists
        useThisAxis = axis_phi_10;    % Assuming axis_phi_10 exists
        showThisTitle = 'phi viz = 10%';
    end






    %%%%%%%%%%%%% Average Value %%%%%%%%%%%%%%%
    phi=[1 5 10];

    t_clog_phi_1(t_clog_phi_1 ==0) = [];
    mean_t_clog=[mean(t_clog_phi_1) mean(t_clog_phi_5) mean(t_clog_phi_10)];

    figure(figtix+1)
    yyaxis left
    plot(phi,mean_t_clog,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    axis([0 15 0 2000])
    xlabel('$\phi\,(\%)$','Interpreter','latex')
    ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
    set(gca,'FontSize',20)


    %%%%%%%  Average Volume %%%%%%%%%%%%%%%
    Q=0.5; %Flow rate in mL/min
    Q_s=Q./60; %Flow rate in mL/s
    yyaxis right
    plot(phi,mean_t_clog.*Q,'o','MarkerFaceColor',ccolor(4,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
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

    figure(figtix+2)
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

    figure(figtix+3)
    h_10=histogram(t_clog_phi_10,6,'Normalization', 'probability');
    x=h_10.BinEdges(1:end-1)+h_10.BinWidth./2;
    y=h_10.Values;
    axis([0 x(end) 0 1])
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    title(showThisTitle)

    %%%% Fit Data
    yy=log(y);
    x=x(isfinite(yy));
    y = y(isfinite(yy));
    yy = yy(isfinite(yy));


    figure(figtix+4)
    plot(x,y,'o','MarkerFaceColor',ccolor(2,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
    hold on
    s= mean(t_clog_phi_10);
    x_fit=0:1:2000;
    loglog(x_fit,exp(-x_fit./s),'--','Color', ccolor(2,:),'linewidth',SizeLine)
    set(gca,'yscale','log');
    ylabel('$p(t_{\rm clog})$','Interpreter','latex')
    xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
    set(gca,'FontSize',20)
    axis([0 2000 1e-2 1])
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

    figure(figtix+5)
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

    figure(figtix+5)
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

    dataNames = {"5_old", "10_old","10_press", "5", "10"};
end