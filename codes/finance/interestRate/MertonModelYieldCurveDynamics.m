close all
clear all

rng(1);
T=0:0.1:30;

r0 = 0.02;
a = 0.001;
sig=0.004;
y0 = r0 + 0.5*a*T + 0.1667*sig^2.*T.^2;

%% 1Y evoluation
h = figure(1)
plot(T,y0,'linewidth',2,'color','black')
xlabel('time T, year')
ylabel('yield y')
ylim([0,0.05])
N = 10;
Z = randn(N,1);


for i=1:N
    yset(i,:) = y0;
    yset(i,:) = bsxfun(@plus,yset(i,:), a + sig*Z(i));
    figure(1)
    hold on
    plot(T,yset(i,:),'linewidth',0.5)

end
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'MertonModelYieldCurveEvoluation1Y.pdf')
%% 5Y evoluation
h = figure(2)
plot(T,y0,'linewidth',2,'color','black')
xlabel('time T, year')
ylabel('yield y')
ylim([0,0.05])
N = 10;
Z = randn(N,1);


for i=1:N
    yset(i,:) = y0;
    yset(i,:) = bsxfun(@plus,yset(i,:), a*5 + sig*sqrt(5)*Z(i));
    figure(2)
    hold on
    plot(T,yset(i,:),'linewidth',0.5)

end
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'MertonModelYieldCurveEvoluation5Y.pdf')
%% 5Y maturity evoluation
t=0:0.1:5;
dt = t(2)-t(1);
h = figure(3)
hold on;
for ntraj = 1:10
N = length(t);
Z = randn(N,1);
W(1)=0;
for i = 2: length(t)
    W(i) = W(i-1) + sig*sqrt(dt)*Z(i);
end
y_5Y = r0 + 0.5*a*t + W + 0.5*a*(5-t) + 0.1667*sig^2.*(5-t).^2;
% zero coupon bond price
P_5Y = exp(-y_5Y.*(5-t));
h = figure(3)
plot(t,y_5Y,'linewidth',1)
xlabel('time t, year')
ylabel('yield y(t,5Y)')
ylim([0,0.05])




h2 = figure(5)
plot(t,P_5Y,'linewidth',1);
hold on
xlabel('time t, year')
ylabel('P(t,5Y)')
ylim([0.6,1.1])


end
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'MertonModel5YYieldEvoluation.pdf')
saveTightFigure(h2,'MertonModel5YZCBEvoluation.pdf')
%% 10Y maturity evoluation
t=0:0.1:10;
dt = t(2)-t(1);
h = figure(4)
hold on;
for ntraj = 1:10
N = length(t);
Z = randn(N,1);
W(1)=0;
for i = 2: length(t)
    W(i) = W(i-1) + sig*sqrt(dt)*Z(i);
end
y_10Y = r0 + 0.5*a*t + W + 0.5*a*(5-t) + 0.1667*sig^2.*(5-t).^2;

h = figure(4)
plot(t,y_10Y,'linewidth',1)
xlabel('time t, year')
ylabel('yield y(t,10Y)')
ylim([0,0.05])

% zero coupon bond price
P_10Y = exp(-y_10Y.*(10-t));
h2 = figure(6)
plot(t,P_10Y,'linewidth',1);
hold on
xlabel('time t, year')
ylabel('P(t,10Y)')
ylim([0.6,1.1])
end
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'MertonModel10YYieldEvoluation.pdf')
saveTightFigure(h2,'MertonModel10YZCBEvoluation.pdf')