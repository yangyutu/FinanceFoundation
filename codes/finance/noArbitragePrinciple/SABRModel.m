clear all
close all
colorSet = jet(10);
Settle = '12-Jun-2013';
ExerciseDate = '12-Jun-2016';
CurrentForwardValue = 0.03;

PlottingStrikes = (1.75:0.1:5.50)'/100;

alpha = 0.060277;
beta = 0.5;
rho = 0.2097;
nu = 0.75091;

addTimeSet = [90:90:270];

for i=1:length(addTimeSet)
    time = datenum(Settle) + addTimeSet(i);

ComputedVols = blackvolbysabr(alpha, beta, rho, nu, time, ...
    ExerciseDate, CurrentForwardValue, PlottingStrikes);

figure(1)
hold on
plot(PlottingStrikes, ComputedVols,'linewidth',1,'color',colorSet(3*i,:));
end
xlabel('Strike')
ylabel('Log-normal volatility')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')

alphaSet = [0.01: 0.01: 0.1];
for i = 1: length(alphaSet)
    alpha = alphaSet(i);
    ComputedVols = blackvolbysabr(alpha, beta, rho, nu, Settle, ...
    ExerciseDate, CurrentForwardValue, PlottingStrikes);
    figure(2)
    hold on
plot(PlottingStrikes, ComputedVols,'linewidth',1);
end
xlabel('Strike')
ylabel('Log-normal volatility')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')



alpha = 0.060277;
beta = 0.5;
rho = 0.2097;
nu = 0.75091;

betaSet = [0.3: 0.1: 0.6];
for i = 1: length(betaSet)
    beta = betaSet(i);
    ComputedVols = blackvolbysabr(alpha, beta, rho, nu, Settle, ...
    ExerciseDate, CurrentForwardValue, PlottingStrikes);
    figure(3)
    hold on
plot(PlottingStrikes, ComputedVols,'linewidth',1);
end
xlabel('Strike')
ylabel('Log-normal volatility')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')

alpha = 0.060277;
beta = 0.5;
rho = 0.2097;
nu = 0.75091;

rhoSet = [0.05: 0.05: 0.6];
for i = 1: length(rhoSet)
    rho = rhoSet(i);
    ComputedVols = blackvolbysabr(alpha, beta, rho, nu, Settle, ...
    ExerciseDate, CurrentForwardValue, PlottingStrikes);
    figure(4)
    hold on
plot(PlottingStrikes, ComputedVols,'linewidth',1);
end
xlabel('Strike')
ylabel('Log-normal volatility')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')


alpha = 0.060277;
beta = 0.5;
rho = 0.2097;
nu = 0.75091;

nuSet = [0.4: 0.1: 1.6];
for i = 1: length(nuSet)
    nu = nuSet(i);
    ComputedVols = blackvolbysabr(alpha, beta, rho, nu, Settle, ...
    ExerciseDate, CurrentForwardValue, PlottingStrikes);
    figure(5)
    hold on
plot(PlottingStrikes, ComputedVols,'linewidth',1);
end
xlabel('Strike')
ylabel('Log-normal volatility')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')