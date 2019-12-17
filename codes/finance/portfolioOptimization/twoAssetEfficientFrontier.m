clear all
close all

mu_1=0.06;
mu_2=0.08;
sig_1 = 0.3;
sig_2 = 0.4;
rho = 0.5;


muSet = 0:0.001:0.1;
muSet2 = mu_1:0.001:mu_2;
mu = muSet;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

h = figure(1);
plot(sig,muSet,'linewidth',2)
hold on
mu = muSet2;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

plot(sig,mu,'o')
plot(sig_1,mu_1,'*','color','black')
plot(sig_2,mu_2,'*','color','black')

%%%
rho = -0.5;


muSet = 0:0.001:0.1;
muSet2 = mu_1:0.001:mu_2
mu = muSet;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

h = figure(1);
plot(sig,muSet,'linewidth',2)
hold on
mu = muSet2;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

plot(sig,mu,'o')
plot(sig_1,mu_1,'*','color','black')
plot(sig_2,mu_2,'*','color','black')
ylabel('mean return')
xlabel('standard deviation')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'twoAssetEfficientFrontierCaseOne.pdf')
%%%

mu_1=0.06;
mu_2=0.08;
sig_1 = 0.5;
sig_2 = 0.4;
rho = 0.5;


muSet = 0:0.001:0.1;
muSet2 = mu_1:0.001:mu_2
mu = muSet;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

h = figure(3)
plot(sig,muSet,'linewidth',2)
hold on
mu = muSet2;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

plot(sig,mu,'o')

plot(sig_1,mu_1,'*','color','black')
plot(sig_2,mu_2,'*','color','black')


%%%
rho = -0.5;


muSet = 0:0.001:0.1;
muSet2 = mu_1:0.001:mu_2
mu = muSet;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

h = figure(3)
plot(sig,muSet,'linewidth',2)
hold on
mu = muSet2;
x = (mu - mu_2)/(mu_1-mu_2);
sig = sqrt(x.^2*sig_1^2 + 2*x.*(1-x)*rho*sig_1*sig_2+(1-x).^2*sig_2^2);

plot(sig,mu,'o')

plot(sig_1,mu_1,'*','color','black')
plot(sig_2,mu_2,'*','color','black')
ylabel('mean return')
xlabel('standard deviation')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'twoAssetEfficientFrontierCaseTwo.pdf')
