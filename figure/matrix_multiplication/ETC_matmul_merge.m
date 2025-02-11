% For Matlab results, please run MFETC_matmul.m first
% For Python results, please run 3 individual scripts, then convert to mat
% file with proc_results.py

load results_matmul.mat % Matlab matmul results

t=[arrayfun(@(x) x.FunctionTable(2).TotalTime,results.plain.p)];
tt(:,:,1)=t;
t=[arrayfun(@(x) x.FunctionTable(2).TotalTime,results.L1-opt_plain.p)];
tt(:,:,2)=t;
t=[arrayfun(@(x) x.FunctionTable(1).TotalTime,results.Strassen.p)];
tt(:,:,3)=t;
t=tt;

List_N=double(List_N);
N=List_N(1:end);

MAG=1;
f1=figure(1);
set(f1,'Resize',true)
f1.Units='centimeters';
f1.Position(3:4)=[18,16]*MAG;

sa1=subplot(2,2,1);
hold on

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N/N(1);

etc = t(:,:,1) ./ t(:,1,1);
m=mean(etc,1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

etc = t(:,:,2) ./ t(:,1,2);
m=mean(etc,1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

etc = t(:,:,3) ./ t(:,1,3);
m=mean(etc,1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

LW_ref=0.75;
Cl_ref=[1,1,1]*0.5;
plot([1,N(end)/N(1)],[1,N(end)/N(1)],'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^2,'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^3,'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^(2.807),'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')

grid on
sa1.XMinorGrid='off';
sa1.XScale='log';
sa1.YScale='log';
xlim([1,2^6])
ylim([1,2^19.5])
xticks(2.^(0:6))
xticklabels(["1","2","2^2","2^3","2^4","2^5","2^6"])
yticks(2.^(0:3:20))
ytls=["1","2","2^2","2^3","2^4","2^5","2^6","2^7","2^8","2^9","2^{10}","2^{11}","2^{12}","2^{13}","2^{14}","2^{15}","2^{16}","2^{17}","2^{18}","2^{19}"];
yticklabels(ytls(1:3:20))
xlabel({'Normalized input size'})
ylabel("{ETC (Matlab)}")

sa5 = axes();
sa5.Position = [0.15, 0.75, 0.12, 0.17];

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N/N(1);

mfetc=norm_complx(t(:,:,1));
m=mean(mfetc,1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

mfetc=norm_complx(t(:,:,2));
m=mean(mfetc,1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

mfetc=norm_complx(t(:,:,3));
m=mean(mfetc,1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

sa5.XScale='log';
sa5.YScale='log';
xlim([2^5,2^6])
ylim([2^14,2^19.5])
xticks([2^5,2^6])
xticklabels(["2^5","2^6"])
yticks([])


sa2=subplot(2,2,2);
hold on

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N;

m=mean(t(:,:,1),1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,1),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,2),1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,2),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,3),1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,3),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

grid on
sa2.XMinorGrid='off';
sa2.XScale='log';
sa2.YScale='log';
xlabel('Matrix size \it{N}')
xticks(List_N)
yticks(10.^(-1:1:6))
ylabel("{ Running time} {\it t} (s) (Matlab)")

lgd1 = legend("","plain algorithm","","","L1-cache-optimized plain algorithm","","","Strassen's algorithm","");
lgd1.Position = [0.4, 0.48, 0.265,0.055];
annotation('textbox',[0.4625,0.8,0.1,0.1176],'String','$O(N^3$)','LineStyle','none','FontSize',7,'FontName','Null','Interpreter','latex','Tag','latex')
annotation('textbox',[0.4625,0.778,0.1,0.1176],'String','$O(N^{2.807}$)','LineStyle','none','FontSize',7,'Interpreter','latex','Tag','latex')
annotation('textbox',[0.4625,0.2271+0.47,0.1,0.1176],'String','$O(N^2$)','LineStyle','none','FontSize',7,'Interpreter','latex','Tag','latex')
annotation('textbox',[0.4625,0.1174+0.47,0.1,0.1176],'String','$O(N$)','LineStyle','none','FontSize',7,'Interpreter','latex','Tag','latex')

sa6 = axes();
sa6.Position = [0.59, 0.76, 0.11, 0.16];

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N;

m=mean(t(:,:,1),1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,1),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,2),1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,2),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,3),1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,3),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

sa6.XScale='log';
sa6.YScale='log';
xlim([4096,8192])
ylim([2e3,2e5])
xticks([4096,8192])
xticklabels(["4096","8192"])
yticks([])


% Python matmal results
load stats_all_plain.mat
tt(:,:,1)=t;
load stats_all_plain_8x8.mat
tt(:,:,2)=t;
load stats_all_Strassen.mat
tt(:,:,3)=t;
t=tt;


List_N=double(List_N);
N=List_N(1:end);

sa1=subplot(2,2,3);
hold on

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N/N(1);

etc = t(:,:,1) ./ t(:,1,1);
m=mean(etc,1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

etc = t(:,:,2) ./ t(:,1,2);
m=mean(etc,1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

etc = t(:,:,3) ./ t(:,1,3);
m=mean(etc,1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(etc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

LW_ref=0.75;
Cl_ref=[1,1,1]*0.5;
plot([1,N(end)/N(1)],[1,N(end)/N(1)],'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^2,'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^3,'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')
plot([1,N(end)/N(1)],[1,N(end)/N(1)].^(2.807),'--','Color',Cl_ref,'LineWidth',LW_ref,'Tag','ref')

grid on
sa1.XMinorGrid='off';
sa1.XScale='log';
sa1.YScale='log';
xlim([1,2^6])
ylim([1,2^19])
xticks(2.^(0:6))
xticklabels(["1","2","2^2","2^3","2^4","2^5","2^6"])
yticks(2.^(0:3:20))
ytls=["1","2","2^2","2^3","2^4","2^5","2^6","2^7","2^8","2^9","2^{10}","2^{11}","2^{12}","2^{13}","2^{14}","2^{15}","2^{16}","2^{17}","2^{18}","2^{19}"];
yticklabels(ytls(1:3:20))
xlabel({'Normalized input size'})
ylabel("{ETC (Python)}")

sa7 = axes();
sa7.Position = [0.15, 0.28, 0.12, 0.17];

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N/N(1);

mfetc=norm_complx(t(:,:,1));
m=mean(mfetc,1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

mfetc=norm_complx(t(:,:,2));
m=mean(mfetc,1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

mfetc=norm_complx(t(:,:,3));
m=mean(mfetc,1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(mfetc,options);
plot(N/N(1),m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

sa7.XScale='log';
sa7.YScale='log';
xlim([2^5,2^6])
ylim([2^14,2^18.5])
xticks([2^5,2^6])
xticklabels(["2^5","2^6"])
yticks([])

sa2=subplot(2,2,4);
hold on

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N;

m=mean(t(:,:,1),1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,1),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,2),1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,2),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,3),1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,3),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

grid on
sa2.XMinorGrid='off';
sa2.XScale='log';
sa2.YScale='log';
xlabel('Matrix size \it{N}')
xticks(List_N)
ylim(10.^[-1,6])
yticks(10.^(-1:1:6))
ylabel("{ Running time} {\it t} (s) (Python)")

% legend("","plain algorithm","","","L1-cache-optimized plain algorithm","","","Strassen's algorithm","")
annotation('textbox',[0.4625,0.33,0.1,0.1176],'String','$O(N^3$)','LineStyle','none','FontSize',7,'Interpreter','latex')
annotation('textbox',[0.4625,0.3124,0.1,0.1176],'String','$O(N^{2.807}$)','LineStyle','none','FontSize',7,'Interpreter','latex')
annotation('textbox',[0.4625,0.2271,0.1,0.1176],'String','$O(N^2$)','LineStyle','none','FontSize',7,'Interpreter','latex')
annotation('textbox',[0.4625,0.1174,0.1,0.1176],'String','$O(N$)','LineStyle','none','FontSize',7,'Interpreter','latex')

sa8 = axes();
sa8.Position = [0.59, 0.29, 0.11, 0.16];

options.handle     = figure(1);
options.alpha      = 0.5;
options.line_width = 0.75;
options.error      = 'std'; 
options.x_axis     = N;

m=mean(t(:,:,1),1);
options.color_line = [1 0 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,1),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,2),1);
options.color_line = [1 0 1]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,2),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

m=mean(t(:,:,3),1);
options.color_line = [0 1 0]*0.7;
options.color_area = options.color_line * 0.5;
error_curve(t(:,:,3),options);
plot(N,m,'o','LineWidth',1.25,'MarkerSize',5,'Color',options.color_line,'Tag','point')

sa8.XScale='log';
sa8.YScale='log';
xlim([4096,8192])
ylim([1e4,5e5])
xticks([4096,8192])
xticklabels(["4096","8192"])
yticks([])

set([findall(gcf,'type','line')],'LineWidth',0.6)
set([findall(gcf,'type','axes')],'FontSize',7)
set([findall(gcf,'type','axes')],'FontName',"Arial")
set([findall(gcf,'type','text')],'FontSize',7)
set([findall(gcf,'type','text')],'FontName',"Arial")

set([findobj(f1,'Tag','point')],'LineWidth',1)
set([findobj(f1,'Tag','mean')],'LineWidth',1.5)
set([findobj(f1,'Tag','ref')],'LineWidth',1.0)

