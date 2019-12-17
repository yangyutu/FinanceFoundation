clear all
close all

rng(5)
%https://www.mathworks.com/help/fininst/price-bermudan-swaptions-with-different-interest-rate-models.html#bts97p1-1
Settle = datenum('21-Jul-2008');

% Zero Curv
T = [1 3 5 7 10 20 30];
CurveDates = daysadd(Settle,360*T,1);
ZeroRates = [1.9 2.6 3.1 3.5 3.8 4.3 4.5]'/100;
ZeroRates = [2 2 2 2 2 2 2]'/100;;
plot(CurveDates,ZeroRates)
datetick
title(['Zero Curve for ' datestr(Settle)]);

irdc = IRDataCurve('Zero',Settle,CurveDates,ZeroRates,'InterpMethod','pchip');
RateSpec = intenvset('Rates',ZeroRates,'EndDates',CurveDates,'StartDate',Settle);

nPeriods = 10;
DeltaTime = 1;
nTrials = 10;

Tenor = (1:1:30)';

SimDates = daysadd(Settle,floor(360*DeltaTime*(0:nPeriods)),1)
SimTimes = diff(yearfrac(SimDates(1),SimDates))

% For 1 year periods and an evenly spaced tenor, the exercise row will be
% the 5th row and the swaption maturity will be the 5th column

HW_alpha = 0.1;
HW_sigma = 0.01;

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


% for bond price trajectory
% https://www.mathworks.com/help/fininst/hullwhite1f.html

%1Y evoluation
h = figure(5)
plot(Tenor, HW1FSimPaths(1,:,1),'linewidth',2,'color','black');
for i = 1:nTrials
    figure(5)
    hold on
    plot(Tenor, HW1FSimPaths(2,:,i),'linewidth',1);
end


%5Y evoluation
h = figure(6)
plot(Tenor, HW1FSimPaths(1,:,1),'linewidth',2,'color','black');
for i = 1:nTrials
    figure(6)
    hold on
    plot(Tenor, HW1FSimPaths(5,:,i),'linewidth',1);
end

%10Y evoluation
h = figure(7)
plot(Tenor, HW1FSimPaths(1,:,1),'linewidth',2,'color','black');
for i = 1:nTrials
    figure(7)
    hold on
    plot(Tenor, HW1FSimPaths(10,:,i),'linewidth',1);
end
