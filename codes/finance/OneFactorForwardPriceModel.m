clear all
close all

N =30;

idx = 1:N;

F_0 = 60 - 10*exp(-0.3*(idx));
h1 = figure(1)
sig = 0.4*exp(-0.1*idx);
plot(idx,sig,'linewidth',2)
xlabel('maturity month index')
ylabel('volality')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

h2 = figure(2)
plot(idx,F_0,'linewidth',2)

dF = F_0.*exp(-0.5.*sig.^2.*idx./12 + sig.*sqrt(idx./12));

hold on
plot(idx,dF,'linewidth',2)
xlabel('maturity month index')
ylabel('forward price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('F(0,T)','F(\Deltat,T)','location','best')
saveTightFigure(h1,'OneFactorForwardVolatilityParallel.pdf')
saveTightFigure(h2,'OneFactorForwardParallelMove.pdf')
%%%

h1 = figure(3)
sig = 0.4*exp(-0.1*idx)-0.2;
plot(idx,sig,'linewidth',2)
xlabel('maturity month index')
ylabel('volality')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

h2 = figure(4)
plot(idx,F_0,'linewidth',2)

dF = F_0.*exp(-0.5.*sig.^2.*idx./12 + sig.*sqrt(idx./12));

hold on
plot(idx,dF,'linewidth',2)
xlabel('maturity month index')
ylabel('forward price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('F(0,T)','F(\Deltat,T)','location','best')
saveTightFigure(h1,'OneFactorForwardVolatilityTwist.pdf')
saveTightFigure(h2,'OneFactorForwardTwistMove.pdf')
%%%

h1 = figure(5)
sig = 0.002*(idx - N/2).^2-0.2;
plot(idx,sig,'linewidth',2)
xlabel('maturity month index')
ylabel('volality')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
h2 = figure(6)
plot(idx,F_0,'linewidth',2)

dF = F_0.*exp(-0.5.*sig.^2.*idx./12 + sig.*sqrt(idx./12));

hold on
plot(idx,dF,'linewidth',2)
xlabel('maturity month index')
ylabel('forward price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('F(0,T)','F(\Deltat,T)','location','best')
saveTightFigure(h1,'OneFactorForwardVolatilityBending.pdf')
saveTightFigure(h2,'OneFactorForwardBendingMove.pdf')