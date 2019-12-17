clear all
close all

sigma = 0.2;
mu = 0.06;
SDE = gbm(0.06, 0.2);  % (B = Return, Sigma)
ntrials = 10;
nPeriods = 99;      % # of simulated observations
dt       =   1/100;      % time increment = 1/100 Y
rng(142857,'twister')
S0=100;
[S,T] = simulate(SDE, nPeriods, 'DeltaTime', dt,'nTrials', ntrials);
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
saveTightFigure(h,'EuropeanOptionValue_underlying.pdf')

r=0.02;

K=100;
% calculate the option prices
for j = 1:length(T)
    t = T(j);
    [call put] = blsprice(squeeze(S(j,:,:)),K, r, t, sigma);
    VcallSet(:,j) = call;
    VputSet(:,j) = put;
    
end

for i=1:10
     h1=figure(2);
     hold on;
     plot(T,VcallSet(i,:),'linewidth',2);
     h2=figure(3);
     hold on;
     plot(T,VputSet(i,:),'linewidth',2);
end

figure(2)
ylabel('Eurppean call value')
xlabel('time, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h1,'EuropeanOptionValue_call.pdf')

figure(3)
ylabel('Eurppean put value')
xlabel('time, Y')
%legend('\sigma_{normal} = 10','\sigma_{normal} = 20','\sigma_{normal} = 30','location','northeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h2,'EuropeanOptionValue_put.pdf')




