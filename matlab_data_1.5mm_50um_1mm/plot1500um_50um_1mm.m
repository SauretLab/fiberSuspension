close all
clear all
clc



% Definition of the output
N_colori=4 ;
ccolor=colormap(brewermap([N_colori],"*RdBu")); % define the colorbar (and the number is the number of data)
Size_Marker=10; % size of the marker
SizeLine=1.5;


%%%%%%%%%%%%%%%%%%%% FIBERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 50um diameter fiber and 1 mm long


%%%%%%%%%%%%%%%%%%%% Nozzle %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diameter 1.5 mm

%%%% phi=1%
t_clog_phi_1 =[ 90, 0,   0, 232, 0,  350, 0,   240, 0,  0];

%%%% phi=5%
t_clog_phi_5  = [41, 161, 1, 27,  43, 11,  135, 36];

%%%% phi=10%
t_clog_phi_10 = [18, 20, 29, 11, 78, 21, 12, 46, 30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31, 26, 246, 33, 82, 45, 104, 29];


%%%%%%%%%%%%% Average Value %%%%%%%%%%%%%%%
phi=[1 5 10];

t_clog_phi_1(t_clog_phi_1 ==0) = [];
mean_t_clog=[mean(t_clog_phi_1) mean(t_clog_phi_5) mean(t_clog_phi_10)];

figure(1)
yyaxis left
plot(phi,mean_t_clog,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
axis([0 15 0 250])
xlabel('$\phi\,(\%)$','Interpreter','latex')
ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
set(gca,'FontSize',20)


%%%%%%%  Average Volume %%%%%%%%%%%%%%%
Q=0.5; %Flow rate in mL/min
Q_s=Q./60; %Flow rate in mL/s
yyaxis right
plot(phi,mean_t_clog.*Q,'o','MarkerFaceColor',ccolor(4,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
ylabel('$\langle Q_{\rm clog} \rangle$ (mL)','Interpreter','latex')
ylim([0 150])



%%%%%%%%%%%%%  Moving Average %%%%%%%%%%%%%%%
%%%% phi=10%
t_clog_phi_10 = [18, 20, 29, 11, 78, 21, 12, 46, 30, 35, 100, 15, 115, 44, 11, 76, 24, 32, 179, 24, 62, 18, 22, 31, 26, 246, 33, 82, 45, 104, 29];

for i=1:size(t_clog_phi_10,2)
Mov_t_clog_10(i)=mean(t_clog_phi_10(1:i))
N_i(i)=i;
end

n_exp = 32; % number of experiments

figure(2)
plot(N_i,Mov_t_clog_10,'o','MarkerFaceColor',ccolor(1,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
axis([0 n_exp 15 100])
xlabel('$\#$Experiments','Interpreter','latex')
ylabel('$\langle t_{\rm clog} \rangle$ (s)','Interpreter','latex')
set(gca,'FontSize',20)

%%% Define mean values and std
t_10=mean(Mov_t_clog_10(end-5:end));
std_t_10=std(Mov_t_clog_10(end-5:end));
hold on
plot([0 n_exp],[t_10 t_10],'k','LineWidth',1.5)
plot([0 n_exp],[t_10-std_t_10 t_10-std_t_10],'k--','LineWidth',1)
plot([0 n_exp],[t_10+std_t_10 t_10+std_t_10],'k--','LineWidth',1)
%%%%%%%%%%%%%  Distribution %%%%%%%%%%%%%%%
%%%% phi=10%
t_clog_phi_10 = [18, 20, 29, 11,  78, 21,  12,  46,  30, 35];

figure(3)
h_10=histogram(t_clog_phi_10,3,'Normalization', 'probability')
x=h_10.BinEdges(1:end-1)+h_10.BinWidth./2;
y=h_10.Values;
axis([0 100 0 0.4])
ylabel('$p(t_{\rm clog})$','Interpreter','latex')
xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
set(gca,'FontSize',20)

figure(4)
plot(x,y,'o','MarkerFaceColor',ccolor(2,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
hold on
s= mean(t_clog_phi_10);
x_fit=0:1:100;
loglog(x_fit,exp(-x_fit./s),'--','Color', ccolor(2,:),'linewidth',SizeLine)
set(gca,'yscale','log');
ylabel('$p(t_{\rm clog})$','Interpreter','latex')
xlabel('$ t_{\rm clog} $ (s)','Interpreter','latex')
set(gca,'FontSize',20)