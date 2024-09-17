close all
clear
clc



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

%%%% phi=5%
t_clog_phi_5  = [2155, 370, 995, 617, 285, 1318, 223, 309, 166, 218, 740, 59, 703, 288, 168]

%%%% phi=10%
t_clog_phi_10 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31,26, 246, 33, 82, 45, 104, 29, 94, 705, 264, 105, 66, 54, 277, 74, 104, 28, 39, 323, 124, 239, 59, 45, 181, 123, 28, 21, 101, 18, 52, 30, 16, 64, 87, 14, 29, 32, 133, 246, 55, 86, 100, 136, 98, 13, 48, 116, 32, 113, 82, 90, 120, 18, 29, 12, 27, 69, 154];

axis_phi_5 = [0 20 15 1500];
axos_phi_10 = [0 85 15 150];

showThisPhi = t_clog_phi_5;
useThisAxis = axis_phi_5;
showThisTitle = 'phi = 5%'



%%%%%%%%%%%%% Average Value %%%%%%%%%%%%%%%
phi=[1 5 10];

t_clog_phi_1(t_clog_phi_1 ==0) = [];
mean_t_clog=[mean(t_clog_phi_1) mean(t_clog_phi_5) mean(t_clog_phi_10)];

figure(1)
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

figure(2)
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

figure(3)
h_10=histogram(t_clog_phi_10,6,'Normalization', 'probability');
x=h_10.BinEdges(1:end-1)+h_10.BinWidth./2;
y=h_10.Values;
axis([0 2000 0 0.5])
ylabel('$p(t_{\rm clog})$','Interpreter','latex')
xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
set(gca,'FontSize',20)
title(showThisTitle)

%%%% Fit Data
yy=log(y);
x=x(isfinite(yy));
y = y(isfinite(yy));
yy = yy(isfinite(yy));


figure(4)
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

figure(5)
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

figure(5)
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
%  figure(100)
%  plot(R0,'ro')
%  hold on
%  plot(R1,'bo')