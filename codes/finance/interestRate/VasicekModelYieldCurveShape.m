clear all
close all

%% first study how parameters affects the yield curve
% k is the speed of mean reversion
% r_bar is the risk-neutral long run mean of the short rate
% sigma is the volatility of the short rate
% Our model is dr(t)=k(r_bar-r(t))dt+sigma*dW, where dW is a Brownian
% motion.
% r is the current short rate at time t
T=0:0.1:30; % tensor
r0=.02;


%% mean reversion rate effect
k=.1;
r_bar=.04;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);

y=B*r0./T - A./T;
h=figure(1)
hold on
plot(T,y,'linewidth',2);

k=.3;
r_bar=.04;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);

y=B*r0./T - A./T;
h=figure(1)
hold on
plot(T,y,'linewidth',2);

k=.5;
r_bar=.04;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(1)
hold on
plot(T,y,'linewidth',2);
plot(T,ones(length(T))*r_bar,'linewidth',2,'color','black');
xlabel('maturity T, year')
ylabel('yield y(0,T)')
ylim([0,0.05])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('\alpha = 0.1','\alpha = 0.3','\alpha = 0.5','\alpha = \infty','location','southwest')
saveTightFigure(h,'VasicekModelYieldCurveShape_reversionSpeed.pdf')


%% mean level effect

k=.3;
r_bar=.01;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(2)
hold on
plot(T,y,'linewidth',2);

k=.3;
r_bar=.02;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(2)
hold on
plot(T,y,'linewidth',2);

k=.3;
r_bar=.04;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(2)
hold on
plot(T,y,'linewidth',2);
xlabel('maturity T, year')
ylabel('yield y(0,T)')
ylim([0,0.05])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('r^* = 0.01','r^* = 0.02','r^* = 0.04','location','southwest')
saveTightFigure(h,'VasicekModelYieldCurveShape_meanLevel.pdf')
%% volatility level effect
k=.3;
r_bar=.04;
sigma=.01;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(3)
hold on
plot(T,y,'linewidth',2);

k=.3;
r_bar=.04;
sigma=.04;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(3)
hold on
plot(T,y,'linewidth',2);

k=.3;
r_bar=.04;
sigma=.08;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);
y=B*r0./T - A./T;
h=figure(3)
hold on
plot(T,y,'linewidth',2);
xlabel('maturity T, year')
ylabel('yield y(0,T)')
ylim([0,0.05])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('\sigma = 0.01','\sigma = 0.04','\sigma = 0.08','location','southwest')
saveTightFigure(h,'VasicekModelYieldCurveShape_volatilityLevel.pdf')