clear all
close all

F0= 100;% S0 here stands for F, the true S0 is 100*exp(-rT)
K = 50:150;
r = 0.02;
T = 1;
sigma = 0.2;

% the slope
theta = 0;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
h = figure(1)
plot(K,volatility_shifted,'linewidth',2)
hold on;
theta = 30;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
theta = -30;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
ylabel('implied lognormal volatility, %')
xlabel('K')
legend('\theta = 0','\theta = 30','\theta = -30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ShiftedLognormalImpliedVolatilityDemo1.pdf')

% the steepness of the slope 1

theta = 10;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
h = figure(2)
plot(K,volatility_shifted,'linewidth',2)
hold on;
theta = 20;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
theta = 30;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
theta = 50;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
ylabel('implied lognormal volatility, %')
xlabel('K')
legend('\theta = 10','\theta = 20','\theta = 30','\theta = 50','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ShiftedLognormalImpliedVolatilityDemo2.pdf')

% the steepness of the slope 2

theta = -10;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
h = figure(3)
plot(K,volatility_shifted,'linewidth',2)
hold on;
theta = -20;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
theta = -30;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
theta = -50;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)

theta = -100;
call = blsprice((F0-theta)*exp(-r*T),K - theta, r, T, sigma);
volatility_shifted = blsimpv(F0*exp(-r*T),K,r,T,call);
plot(K,volatility_shifted,'linewidth',2)
ylabel('implied lognormal volatility, %')
xlabel('K')
legend('\theta = -10','\theta = -20','\theta = -30','\theta = -50','\theta = -100','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ShiftedLognormalImpliedVolatilityDemo3.pdf')