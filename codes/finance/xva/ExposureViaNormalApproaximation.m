clear all
close all

T=0:0.1:30;

mu0=0.05;
mu = mu0.*T;
sigma0 = 0.3;
sigma = sigma0.*sqrt(T);

e = mu.*normcdf(mu./sigma) + sigma.*normpdf(mu./sigma);

h=figure(1)
plot(T,e,'linewidth',2);
xlabel('time, Y')
ylabel('expected exposure')

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'ExposureNormalApproxNoMargin.pdf')


Hset = 0.1:0.1:0.3;
for i = 1:length(Hset)
    
H = Hset(i);

eH = mu.*(normcdf(mu./sigma) - normcdf((mu-H)./sigma) ...
    + sigma.*(normpdf(mu./sigma) - normpdf((mu-H)./sigma)) + H.*normcdf((mu-H)./sigma));

h=figure(2)
hold on;
plot(T,eH,'linewidth',2)

end

xlabel('time, Y')
ylabel('expected exposure')
legend('H=0.1','H=0.2','H=0.3','location','northwest')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'ExposureNormalApproxWithMargin.pdf')