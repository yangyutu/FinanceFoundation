clear all
close all


sig1 = 0.12;
sig2 = 0.1;
rho = -1;
k1 = 0.05;
k2 = 0.2;
T = 0:0.2:30;
v1 = sig1^2*exp(-2*k1.*T);
v2 = sig1^2*exp(-2*k1.*T);
c12 = 2*rho*sig1*sig2*exp(-k1.*T - k2.*T);
V=v1+v2+c12;

h = figure(1)
plot(T,V,'linewidth',2);
xlabel('T, year')
ylabel('\sigma^2(0,T)')

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'GaussianTwoFactorModelHumpedForwardVolatility.pdf')