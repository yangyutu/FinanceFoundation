clear all
close all

%% prepayment speed 0
MortgagePrincipal = 1000000;
Coupon = 0.12;
Terms = 360; % months

speed = 0;
% Calculate underlying mortgage cash flows
[PrincipalBalance, MonthlyPayments, SchedPrincipalPayments, ...
InterestPayments, Prepayments] = ...
mbspassthrough(MortgagePrincipal, Coupon, Terms, Terms, speed, []);
PrincipalPayments = SchedPrincipalPayments.' + Prepayments.';

TranchePrincipals = [500000; 500000];
TrancheCoupons = [0.12; 0.12];

[Balance, Principal, Interest] = cmoseqcf(PrincipalPayments, TranchePrincipals, TrancheCoupons, false);

time = 1: Terms;

h1=figure(1)
hold on
plot(time, Balance,'linewidth',2);
xlabel('Time, M')
ylabel('Balance, $')
legend('tranch A','tranch B','location','southwest');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOBalanceNoPrepayment.pdf')

h1=figure(2)
hold on
plot(time, Principal,'linewidth',2);
xlabel('Time, M')
ylabel('Principal, $')
legend('tranch A','tranch B','location','northwest');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOPrincipalNoPrepayment.pdf')

h1=figure(3)
hold on
plot(time, Interest,'linewidth',2);
xlabel('Time, M')
ylabel('Interest, $')
legend('tranch A','tranch B','location','southwest');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOInterestNoPrepayment.pdf')
%% prepayment speed 100
speed = 100;
MortgagePrincipal = 1000000;
Coupon = 0.12;
Terms = 360; % months


% Calculate underlying mortgage cash flows
[PrincipalBalance, MonthlyPayments, SchedPrincipalPayments, ...
InterestPayments, Prepayments] = ...
mbspassthrough(MortgagePrincipal, Coupon, Terms, Terms, speed, []);
PrincipalPayments = SchedPrincipalPayments.' + Prepayments.';

TranchePrincipals = [500000; 500000];
TrancheCoupons = [0.12; 0.12];

[Balance, Principal, Interest] = cmoseqcf(PrincipalPayments, TranchePrincipals, TrancheCoupons, false);

time = 1: Terms;

h1=figure(4)
hold on
plot(time, Balance,'linewidth',2);
xlabel('Time, M')
ylabel('Balance, $')
legend('tranch A','tranch B','location','northeast');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOBalanceWithPrepayment.pdf')


h1=figure(5)
hold on
plot(time, Principal,'linewidth',2);
xlabel('Time, M')
ylabel('Principal, $')
legend('tranch A','tranch B','location','northeast');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOPrincipalWithPrepayment.pdf')

h1=figure(6)
hold on
plot(time, Interest,'linewidth',2);
xlabel('Time, M')
ylabel('Interest, $')
legend('tranch A','tranch B','location','northeast');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'Box','on')
saveTightFigure(h1,'SequentialCMOInterestWithPrepayment.pdf')