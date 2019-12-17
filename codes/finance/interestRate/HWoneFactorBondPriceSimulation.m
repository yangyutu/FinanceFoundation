clear all
close all

%https://www.mathworks.com/help/fininst/hullwhite1f.html
rng(1)
Settle = datenum('4-Apr-2016');
ZeroTimes = [3/12 6/12 1 5 7 10 20 30]';
ZeroRates = [0.033 0.034 0.035 0.040 0.042 0.044 0.048 0.0475]';
ZeroDates = datemnth(Settle,ZeroTimes*12);
RateSpec = intenvset('StartDates', Settle,'EndDates', ZeroDates, 'Rates', ZeroRates)

Maturity = datemnth(Settle,12*5);
CouponRate = 0;

alpha = .1;
sigma = .01;
HW1F = HullWhite1F(RateSpec,alpha,sigma)

nTrials = 100;
nPeriods = 12*5; % we divide into 60 points in time axis to evaluate the bond price
deltaTime = 1/12;
Tenor = [1:1:5]
SimZeroCurvePaths = simTermStructs(HW1F, nPeriods,'nTrials',nTrials,'deltaTime',deltaTime);% generate zero curve samples
SimDates = datemnth(Settle,1:nPeriods);

SimBondPrice = zeros(nPeriods+1,nTrials);
SimBondPrice(1,:,:) = bondbyzero(RateSpec,CouponRate,Settle,Maturity);
SimBondPrice(end,:,:) = 100;

for periodidx=1:nPeriods-1
    simRateSpec = intenvset('StartDate',SimDates(periodidx),'EndDates',...
        datemnth(SimDates(periodidx),ZeroTimes*12),'Rates',squeeze(SimZeroCurvePaths(periodidx+1,:,:)));
    SimBondPrice(periodidx+1,:) = bondbyzero(simRateSpec,CouponRate,SimDates(periodidx),Maturity);
end

h=figure(2);
plot([Settle SimDates],SimBondPrice)
datetick
ylabel('Bond Price')
xlabel('Simulation Dates')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'HWBondDynamicsTrajectories.pdf')

h=figure(3)
trialIdx = 1;
surf(ZeroTimes,SimDates,SimZeroCurvePaths(1:end-1,:,trialIdx))
datetick y keepticks keeplimits
title(['Zero Curve for sample path:' num2str(trialIdx) ])
xlabel('Tenor (Years)')
ylabel('Time t')
zlabel('yield y')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
saveTightFigure(h,'HWBondDynamics_zeroCurveOne.pdf')
%pbaspect([1 1 1])
%set(gca,'box','on')
h=figure(4)
trialIdx = 2;
surf(ZeroTimes,SimDates,SimZeroCurvePaths(1:end-1,:,trialIdx))
datetick y keepticks keeplimits
title(['Zero Curve sample path:' num2str(trialIdx) ])
xlabel('Tenor (Years)')
ylabel('Time t')
zlabel('yield y')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
saveTightFigure(h,'HWBondDynamics_zeroCurveTwo.pdf')
%pbaspect([1 1 1])
%set(gca,'box','on')