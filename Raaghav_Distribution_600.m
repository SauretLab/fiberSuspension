close all
clear all

% Definition of the output
ccolor=colormap(brewermap([10],"*RdPu")) ;% define the colorbar (and the number is the number of data)
Size_Marker=10; % size of the marker
SizeLine=1.5;

%% L=600um - 5%
colori=1;
N_600=[299.0658116	425.0536249	48.69146609	576.5620642	449.3096483	385.5370767	240.1009631	253.5846992	681.6090336	173.1013083	247.2199945	399.5263262	373.0863397	285.200335	273.1113577	82.17923212	436.2183599	705.7729347	595.1218894	379.9772141	241.1583102	206.5294259	1144.286337	443.6490777	864.8131032	310.3490357	219.7963531	557.91048	418.438976	985.0602369	528.254482	527.8300357	250.6896942	248.451441	870.7352064	269.2064259	163.2566102	1278.809422	230.1582325	611.8377259	108.7474303	843.1041915	35.41900563	1244.058437	663.7496712	124.2192869	1247.18702	537.6046698	271.6076345	409.3321695	667.9713464	647.4741004	1020.849534	424.8369055	3632.1078	427.7289946	38.62880945	399.6813099	304.9074268	98.90530038	33.80775785	33.59797025	330.6402502	21.53155828	483.8754909	655.2248485	894.6970468	480.1166754	521.280225	447.8506906	278.5428305	655.2806308	67.39562178	573.3773456	39.12327099	96.57652617	19.91626954	484.8587155	458.2132316	298.3625731	757.1651702	1271.808025	355.3012524	709.5919609	281.9548886	35.01376343	417.6623347	681.9860449	1075.445659	204.2016516	101.8089364	91.93254542	852.2449975	82.38406873	1207.540382	786.150825	183.0858905	294.1503181	464.102509	23.23622084	347.7475312	78.44907403	278.1360567	411.3204391	474.8994944	11.06837845	778.0880799	1329.645231	570.8665469	1042.56164	531.6448591	370.6899865	966.5878174	1219.696081	189.7040112	915.3253822]; 


figure(1)
h_600=histogram(N_600,11,'Normalization', 'probability');
x=h_600.BinEdges(1:end-1)+h_600.BinWidth./2;
y=h_600.Values;
yy=log(y);




x=x(isfinite(yy));
y = y(isfinite(yy));
yy = yy(isfinite(yy));

figure(2)
p1=plot(x,y,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker);
hold on

s= mean(N_600);
x_fit=0:1:10000;
[F, G] = fit(x(2:end)',yy(2:end)','poly1');
loglog(x_fit,exp(F.p2).*exp(x_fit.*F.p1),'--','Color', ccolor(colori,:),'linewidth',SizeLine);
set(gca,'yscale','log');
xlabel('$ t_{\rm clog} $','Interpreter','latex')
ylabel('$P( t_{\rm clog} )$','Interpreter','latex')
set(gca,'FontSize',20)
axis([0 4000 1e-3 1])

figure(3)
plot(x./s,y,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker);
set(gca,'yscale','log');
hold on
x_fit=0:1:10;
loglog(x_fit,exp(-x_fit),'--','Color', ccolor(colori,:),'linewidth',SizeLine)
set(gca,'yscale','log');
axis([0 6 1e-3 2])
xlabel('$ t_{\rm clog} /\langle t_{\rm clog} \rangle $','Interpreter','latex')
ylabel('$P( t_{\rm clog} /\langle t_{\rm clog} \rangle )$','Interpreter','latex')
set(gca,'FontSize',20)

figure(4)
plot(5,s,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
hold on
xlabel('$\phi\,(\%)$','Interpreter','latex')
ylabel('$\langle t_{\rm clog} \rangle$','Interpreter','latex')
set(gca,'FontSize',20)

%% L=600um - 10%
colori=4;
N_600=[400.1490288	358.0089355	39.30705905	71.47735047	399.3158293	497.1233952	400.1133621	280.8951426	291.2488246	238.9714217	229.6478789	202.6960976	384.9667993	71.9782846	586.4217238	666.2991555	339.3929043	161.4633582	195.3358703	410.143291	454.9338672	395.5079601	318.0766346	132.7089348	745.8835213	464.6631176	251.318264	182.3564444	320.1971283	169.8044326	187.2048247	322.1911013	233.7419217	413.7043123	268.8375597	151.2029555	466.5792053	210.3065925	278.8782842	195.1441104	234.0415413	421.7243145	271.727057	268.327858];




figure(1)
h_600=histogram(N_600,3,'Normalization', 'probability');
x=h_600.BinEdges(1:end-1)+h_600.BinWidth./2;
y=h_600.Values;
yy=log(y);

x=x(isfinite(yy));
y = y(isfinite(yy));
yy = yy(isfinite(yy));

figure(2)
p1=plot(x,y,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker);
hold on

s= mean(N_600);
x_fit=0:1:10000;
[F, G] = fit(x(2:end)',yy(2:end)','poly1');
loglog(x_fit,exp(F.p2).*exp(x_fit.*F.p1),'--','Color', ccolor(colori,:),'linewidth',SizeLine);
set(gca,'yscale','log');

figure(3)
plot(x./s,y,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker);
set(gca,'yscale','log');
hold on
x_fit=0:1:10;
loglog(x_fit,exp(-x_fit),'--','Color', ccolor(colori,:),'linewidth',SizeLine)

figure(4)
plot(10,s,'o','MarkerFaceColor',ccolor(colori,:),'MarkerEdgeColor','k', 'MarkerSize',Size_Marker)
hold on
axis([0 20 0 1000])
xlabel('$\phi\,(\%)$','Interpreter','latex')
ylabel('$\langle t_{\rm clog} \rangle$','Interpreter','latex')

