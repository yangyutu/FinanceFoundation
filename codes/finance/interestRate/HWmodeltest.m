clear all
close all

Settle = '20-Jan-2000';
RateSpec = intenvset('Rates', 0.05, 'StartDates',Settle, 'EndDates', '20-Jan-2030', 'compounding',-1);

%RateSpec = intenvset('Rates',ZeroRates,'EndDates',CurveDates,'StartDate',Settle);

alpha = .1;
sigma = .01;
 
HW1F = HullWhite1F(RateSpec,alpha,sigma)

nPeriods = 10;
DeltaTime = 1;
nTrials = 10;

Tenor = (1:30)';

SimDates = daysadd(Settle,360*DeltaTime*(0:nPeriods),1)
SimTimes = diff(yearfrac(SimDates(1),SimDates))

% For 1 year periods and an evenly spaced tenor, the exercise row will be
% the 5th row and the swaption maturity will be the 5th column

HW_alpha = 0.0967;
HW_sigma = 0.0088;

HW1F = HullWhite1F(RateSpec,HW_alpha,HW_sigma);


HW1FSimPaths = HW1F.simTermStructs(nPeriods,'NTRIALS',nTrials,...
    'DeltaTime',DeltaTime,'Tenor',Tenor,'antithetic',true);
trialIdx = 1;
figure(2)
surf(Tenor,SimDates,HW1FSimPaths(:,:,trialIdx))
datetick y keepticks keeplimits
title(['Evolution of the Zero Curve for sample path:' num2str(trialIdx) ' from Hull White Model'])
xlabel('Tenor (Years)')

trialIdx = 2;
figure(3)
surf(Tenor,SimDates,HW1FSimPaths(:,:,trialIdx))
datetick y keepticks keeplimits
title(['Evolution of the Zero Curve for sample path' num2str(trialIdx) ' from Hull White Model'])
xlabel('Tenor (Years)')

