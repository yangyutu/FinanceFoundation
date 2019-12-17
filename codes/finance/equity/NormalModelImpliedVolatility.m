clear all
close all

F = 100;
K = 50:150;

r = 0.02;
T = 1;
sigma = 10;
d1 = (F - K)./sigma/sqrt(T);

call = exp(-r*T)*((F-K).*normcdf(d1) + sigma*sqrt(T)*normpdf(d1));
volatility_noram = blsimpv(F*exp(-r*T),K,r,T,call);
h = figure(1)
plot(K,volatility_noram,'linewidth',2)
hold on


sigma = 20;
d1 = (F - K)./sigma/sqrt(T);
call = exp(-r*T)*((F-K).*normcdf(d1) + sigma*sqrt(T)*normpdf(d1));
volatility_noram = blsimpv(F*exp(-r*T),K,r,T,call);
h = figure(1)
plot(K,volatility_noram,'linewidth',2)
hold on

sigma = 30;
d1 = (F - K)./sigma/sqrt(T);
call = exp(-r*T)*((F-K).*normcdf(d1) + sigma*sqrt(T)*normpdf(d1));
volatility_noram = blsimpv(F*exp(-r*T),K,r,T,call);
h = figure(1)
plot(K,volatility_noram,'linewidth',2)
hold on

ylabel('implied lognormal volatility, %')
xlabel('K')
legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'NormalModelImpliedVolatilityDemo1.pdf')

