clear all
close all

T=0:0.1:30;

%% case 1. normal yield
a = 0.001;
b = 0.003;
y1 = 0.01 + a*T - (b)^2*T.^2;
f1 = y1 + a - 2*T*b^2;


h=figure(1)
plot(T,y1,'linewidth',2);
hold on
plot(T,f1,'linewidth',2)
ylim([0,0.04])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

xlabel('maturity, year')
ylabel('rate')
legend('yield y','forward rate f','Location','southeast')
saveTightFigure(h,'forwardCurveZeroCurveNormal.pdf')
%% case 2. inverted yield
a = 0.0005;
b = 0.003;
y1 = 0.03 - a*T - (b)^2*T.^2;
f1 = y1 + a - 2*T*b^2;


h=figure(2)
plot(T,y1,'linewidth',2);
hold on
plot(T,f1,'linewidth',2)
ylim([0,0.04])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

xlabel('maturity, year')
ylabel('rate')
legend('yield y','forward rate f','Location','southeast')
saveTightFigure(h,'forwardCurveZeroCurveInverted.pdf')
%% case 3. humped yield
a = 0.001;
b = 0.006;
y1 = 0.02 + a*T - (b)^2*T.^2;
f1 = y1 + a - 2*T*b^2;


h=figure(3)
plot(T,y1,'linewidth',2);
hold on
plot(T,f1,'linewidth',2)
ylim([0,0.04])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

xlabel('maturity, year')
ylabel('rate')
legend('yield y','forward rate f','Location','southeast')
saveTightFigure(h,'forwardCurveZeroCurveHumped.pdf')
%%matlab example
ZeroRates = [0.0458
             0.0502
             0.0518
             0.0519
             0.0524
             0.0519
             0.0523
             0.0525
             0.0541
             0.0529];

CurveDates = [datenum('06-Nov-2000')
             datenum('11-Dec-2000')
             datenum('15-Jan-2001')
             datenum('05-Feb-2001')
             datenum('04-Mar-2001')
             datenum('02-Apr-2001')
             datenum('30-Apr-2001')
             datenum('25-Jun-2001')
             datenum('04-Sep-2001')
             datenum('12-Nov-2001')];

Settle = datenum('03-Nov-2000');
InputCompounding = 1;
InputBasis = 2;
OutputCompounding = 1;
OutputBasis = 2;

[ForwardRates, CurveDates] = zero2fwd(ZeroRates, CurveDates,...
Settle, 'InputCompounding',1,'InputBasis',2,'OutputCompounding',1,'OutputBasis',2)

figure(10)
plot(datetime(CurveDates,'convertfrom','datenum'), ZeroRates)
ylabel('zero rates')

xlabel('maturity')
xtickformat('yyyy')
hold on

plot(datetime(CurveDates,'convertfrom','datenum'), ForwardRates)
