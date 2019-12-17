clear all
close all

OriginalBalance = 100000;
GrossRate = 0.08125;
OriginalTerm = 360;
TermRemaining = 360;
PrepaySpeed = 0;

[Balance, Payment, Principal, Interest, Prepayment] =... 
mbspassthrough(OriginalBalance, GrossRate, OriginalTerm,... 
TermRemaining, PrepaySpeed)

time = 1:TermRemaining;
h1 = figure(1)
plot(time, Balance,'linewidth',2);
xlabel('Time, M')
ylabel('Balance, $')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'MortgageLoanBalanceNoPrepayment.pdf')

h2 = figure(2)
hold on
plot(time, Payment,'linewidth',2);
plot(time, Principal,'linewidth',2);
plot(time, Interest,'linewidth',2);
xlabel('Time, M')
ylabel('Payment, $')
legend('mortgage payment','principle payment','interest payment','location','best')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h2,'MortgageCashFlowNoPrepayment.pdf')
