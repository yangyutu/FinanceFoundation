clear all
close all


S=0:200;
K = 100;

f= zeros(length(S),1);

for i=1:length(S)
    if S(i)>K 
        f(i) = S(i);
    end
end
h  = figure(1)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,200])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'binaryOption_Asset_Call.pdf')


f= zeros(length(S),1);

for i=1:length(S)
    if S(i)< K 
        f(i) = S(i);
    end
end
h  = figure(2)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,200])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'binaryOption_Asset_Put.pdf')


f= zeros(length(S),1);

for i=1:length(S)
    if S(i)>K 
        f(i) = 1;
    end
end
h  = figure(3)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,2])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'binaryOption_Cash_Call.pdf')


f= zeros(length(S),1);

for i=1:length(S)
    if S(i)< K 
        f(i) = 1;
    end
end
h  = figure(4)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,2])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'binaryOption_Cash_Put.pdf')


