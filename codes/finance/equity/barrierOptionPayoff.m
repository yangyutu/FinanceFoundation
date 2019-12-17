clear all
close all


S=0:200;
K = 100;
B = 130;

f= zeros(length(S),1);

for i=1:length(S)
    if S(i)>K && S(i) < B
        f(i) = S(i) - K;
    end
end
h  = figure(1)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,100])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'barrierOption_CALL_UP_OUT.pdf')

f= zeros(length(S),1);

for i=1:length(S)
    if S(i) > B
        f(i) = S(i) - K;
    end
end
h  = figure(2)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,100])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'barrierOption_CALL_UP_IN.pdf')


B = 70;

f= zeros(length(S),1);

for i=1:length(S)
    if S(i)<K && S(i) > B
        f(i) = - S(i) + K;
    end
end
h  = figure(3)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,100])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'barrierOption_PUT_DOWN_OUT.pdf')


f= zeros(length(S),1);

for i=1:length(S)
    if S(i) < B
        f(i) = - S(i) + K;
    end
end
h  = figure(4)
plot(S,f,'linewidth',2);
xlabel('spot price')
ylabel('payoff')
ylim([0,100])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(h,'barrierOption_PUT_DOWN_IN.pdf')


