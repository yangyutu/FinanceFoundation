clear all
close all

PSASpeed = [50, 100, 200];
[CPR, SMM] = psaspeed2rate(PSASpeed);
time = 1: 360;
h2 = figure(2);
plot(time,CPR,'linewidth',2)

%ylim([0 10])
xlabel('Elapsed time, M')
ylabel('CPR')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

saveTightFigure(h2,'MortgagePrepaymentPSAtoCPR.pdf')