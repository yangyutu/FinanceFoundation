clear all
close all

F0= 100;
K = 50:150;
r = 0.02;
T = 1;
sigma = 0.2;

% the slope
theta = 200;
[call put]= blsprice((-F0+theta)*exp(-r*T), -K + theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,put);
h = figure(1)
plot(K,volatility_shifted,'linewidth',2)
hold on;
theta = 300;
[call put]= blsprice((-F0+theta)*exp(-r*T), -K + theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,put);
plot(K,volatility_shifted,'linewidth',2)
theta = 400;
[call put]= blsprice((-F0+theta)*exp(-r*T), -K + theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,put);
plot(K,volatility_shifted,'linewidth',2)
ylabel('implied lognormal volatility, %')
xlabel('K')
legend('\theta = 200','\theta = 300','\theta = 400','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ShiftedAntiLognormalImpliedVolatilityDemo1.pdf')

