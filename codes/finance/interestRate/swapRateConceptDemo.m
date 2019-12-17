clear all
close all


%% spot swap rate
T=0:0.1:30;
S = 0.015+0.001*T - 0.5*(0.0035)^2.*T.^2;

h = figure(1)
plot(T,S,'linewidth',2);
xlabel('tenor \Delta, year');
ylabel('spot swap rate S(t; t,\Delta)');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
ylim([0,0.05])
saveTightFigure(h,'swapRateDemo_spotSwapRateVsTenor.pdf')

%% forward swap rate

T=0:3:30;
S1 = 0.02+0.005*rand(length(T),1);
S2 = 0.005+S1;
S3 = 0.005+S2;


h = figure(2)
plot(T,S1,T,S2,T,S3,'linewidth',2);
xlabel('starting date T_0');
ylabel('forward swap rate S(t; T_0,\Delta)');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
set(gca,'xtick',[])
set(gca,'xticklabel',[])
legend('\Delta = 3Y','\Delta = 5Y', '\Delta = 10Y','location','southeast')
ylim([0,0.05])
saveTightFigure(h,'swapRateDemo_forwardSwapRateVsForwardStartingDate.pdf')
%% the evolution of forward swap rate
rng(1)

T=0:0.1:1;
T=T';
S1 = 0.02+0.01*sqrt(T).*randn(length(T),1);
S2 = 0.02+0.01*sqrt(T).*randn(length(T),1);
S3 = 0.02+0.01*sqrt(T).*randn(length(T),1);


h = figure(3)
plot(T,S1,T,S2,T,S3,'linewidth',2);
xlabel('time t');
ylabel('forward swap rate S(t; T_0,\Delta)');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
set(gca,'xtick',[0 1])
set(gca,'xticklabel',{'t_0','T_0'})
legend('traj. 1','traj. 2', 'traj. 3','location','northwest')
ylim([0,0.05])
saveTightFigure(h,'swapRateDemo_evolutionForwardSwapRate.pdf')