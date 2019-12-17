
clear all
close all

OriginalBalance = 100000;
GrossRate = 0.08125;
OriginalTerm = 360;
TermRemaining = 360;

speedSet = [0, 50, 100, 200];
time = 1:TermRemaining;
for i = 1:length(speedSet)
PrepaySpeed = speedSet(i);

[Balance, Payment, Principal, Interest, Prepayment] =... 
mbspassthrough(OriginalBalance, GrossRate, OriginalTerm,... 
TermRemaining, PrepaySpeed)


h1=figure(1)
plot(time, Balance,'linewidth',2);
hold on
h2=figure(2)
hold on
plot(time, Payment,'linewidth',2);
h3=figure(3)
hold on
plot(time, Principal,'linewidth',2);
h4=figure(4)
hold on
plot(time, Interest,'linewidth',2);
h5=figure(5)
hold on
plot(time, Prepayment,'linewidth',2);
end

figure(1)
xlabel('Time, M')
ylabel('Balance, $')
legend('PSA=0','PSA=50','PSA=100','PSA=150')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'MortgageLoanBalanceDifferentPrepayment.pdf')


figure(2)
xlabel('Time, M')
ylabel('Monthly payment, $')
legend('PSA=0','PSA=50','PSA=100','PSA=150')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h2,'MortgagePaymentDifferentPrepayment.pdf')

figure(3)
xlabel('Time, M')
ylabel('Principle payment, $')
legend('PSA=0','PSA=50','PSA=100','PSA=150','location','northwest')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h3,'MortgagePrincipleDifferentPrepayment.pdf')

figure(4)
xlabel('Time, M')
ylabel('Interest payment, $')
legend('PSA=0','PSA=50','PSA=100','PSA=150')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h4,'MortgageInterestDifferentPrepayment.pdf')

figure(5)
xlabel('Time, M')
ylabel('Prepayment, $')
legend('PSA=0','PSA=50','PSA=100','PSA=150')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h5,'MortgagePrepaymentDifferentPrepayment.pdf')

