clear all
close all

%% reversion speed effect
T=0:0.1:30;
r0=0.02;

mu = 0.03;
sigma = 0.02;
kset = [0.1 0.3 0.5];
for i=1:length(kset)
k = kset(i);
h = sqrt(k^2 + 2*sigma^2);
A = (2*k*mu/sigma^2).*log((2*h.*exp((k+h).*T/2))./(2*h + (k+h).*(exp(T.*h) - 1)));
B = 2.*(exp(h.*T) - 1)./(2*h + (k+h).*(exp(T.*h) - 1));

y0=B*r0./T - A./T;
h1=figure(1);
hold on
plot(T,y0,'linewidth',2);
end
plot(T,mu*ones(size(T)),'linewidth',2,'color','black');
ylim([0.01 0.031]);
ylabel('y(t,T)')
xlabel('time T, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('k = 0.1','k = 0.3','k= 0.5', 'k = \infty','location','southeast')
saveTightFigure(h1,'CIRModelYieldCurveShape_reversioneffect.pdf')


%% volatility effect
mu = 0.03;
sigmaset = [0.02 0.08 0.15];
k = 0.1;
for i=1:length(kset)
sigma = sigmaset(i);
h = sqrt(k^2 + 2*sigma^2);
A = (2*k*mu/sigma^2).*log((2*h.*exp((k+h).*T/2))./(2*h + (k+h).*(exp(T.*h) - 1)));
B = 2.*(exp(h.*T) - 1)./(2*h + (k+h).*(exp(T.*h) - 1));

y0=B*r0./T - A./T;
h1=figure(2);
hold on
plot(T,y0,'linewidth',2);
end
ylim([0.01 0.031]);
ylabel('y(t,T)')
xlabel('time T, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('\sigma = 0.02','\sigma = 0.08','\sigma = 0.15','location','southeast')
saveTightFigure(h1,'CIRModelYieldCurveShape_volatilityeffect.pdf')


%% mean level effect
muset = [0.01 0.03 0.05];
sigma= 0.02;
k = 0.1;
for i=1:length(kset)
mu = muset(i);
h = sqrt(k^2 + 2*sigma^2);
A = (2*k*mu/sigma^2).*log((2*h.*exp((k+h).*T/2))./(2*h + (k+h).*(exp(T.*h) - 1)));
B = 2.*(exp(h.*T) - 1)./(2*h + (k+h).*(exp(T.*h) - 1));

y0=B*r0./T - A./T;
h1=figure(3);
hold on
plot(T,y0,'linewidth',2);
end
ylim([0.01 0.051]);
ylabel('y(t,T)')
xlabel('time T, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('\mu = 0.01','\mu = 0.03','\mu = 0.05','location','northwest')
saveTightFigure(h1,'CIRModelYieldCurveShape_meanleveleffect.pdf')