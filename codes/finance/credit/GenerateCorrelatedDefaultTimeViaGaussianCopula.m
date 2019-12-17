clear all
close all

n = 500;
h = 0.01;

Z = mvnrnd([0 0], [1 0; 0 1], n);
U = normcdf(Z,0,1);
T = -log(1 - U)./h;
hf=figure(1)
plot(T(:,1),T(:,2),'o');
title('\rho = 0');
xlabel('T1');
ylabel('T2');
xlim([-10,1000])
ylim([-10,1000])

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(hf,'CorrelatedDefaultTimeGaussianCopulaDemo1.pdf')

Z = mvnrnd([0 0], [1 .5; .5 1], n);
U = normcdf(Z,0,1);
T = -log(1 - U)./h;
hf=figure(2)
plot(T(:,1),T(:,2),'o');
title('\rho = 0.5');
xlabel('T1');
ylabel('T2');
xlim([-10,1000])
ylim([-10,1000])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(hf,'CorrelatedDefaultTimeGaussianCopulaDemo2.pdf')

Z = mvnrnd([0 0], [1 0.8; 0.8 1], n);
U = normcdf(Z,0,1);
T = -log(1 - U)./h;
hf=figure(3)
plot(T(:,1),T(:,2),'o');
title('\rho = 0.8');
xlabel('T1');
ylabel('T2');
xlim([-10,1000])
ylim([-10,1000])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(hf,'CorrelatedDefaultTimeGaussianCopulaDemo3.pdf')

Z = mvnrnd([0 0], [1 -.8; -.8 1], n);
U = normcdf(Z,0,1);
T = -log(1 - U)./h;
hf=figure(4)
plot(T(:,1),T(:,2),'o');
title('\rho = -0.8');
xlabel('T1');
ylabel('T2');
xlim([-10,1000])
ylim([-10,1000])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(hf,'CorrelatedDefaultTimeGaussianCopulaDemo4.pdf')