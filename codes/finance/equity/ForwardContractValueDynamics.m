clear all
close all

SDE = gbm(0.02, 0.2);  % (B = Return, Sigma)

nPeriods = 59;      % # of simulated observations
dt       =   1/12;      % time increment = 1 month
rng(142857,'twister')
S0=100;
[S,T] = simulate(SDE, nPeriods, 'DeltaTime', dt,'nTrials', 10);
% simulating stock price
S = S.*S0;
for i=1:10
    h=figure(1)
    hold on;
    plot(T,S(:,:,i),'linewidth',2);
end
ylabel('underlying value')
xlabel('time, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ForwardContractValue_underlying.pdf')

r=0.02;
% calculate the forward prices
V = S - S0*exp(r*T);

for i=1:10
    h=figure(2)
    hold on;
    plot(T,V(:,:,i),'linewidth',2);
end
ylabel('forward contract value')
xlabel('time, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'ForwardContractValue.pdf')




