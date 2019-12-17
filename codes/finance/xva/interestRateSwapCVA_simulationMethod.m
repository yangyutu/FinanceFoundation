clear all
close all


Settle = datenum('15-Dec-2007');
ValuationDate = Settle;
CurveTimes = [1:5 7 10 20]';
Tenor = CurveTimes;
ZeroRates = [.01 .018 .024 .029 .033 .034 .035 .034]';
ZeroDates = daysadd(Settle,360*CurveTimes,1);
 
irdc = IRDataCurve('Zero',Settle,ZeroDates,ZeroRates);
    
alpha = .1;
sigma = .01;
 
HW1F = HullWhite1F(irdc,alpha,sigma);

%% Set Changeable Simulation Parameters
% We can vary here the number of simulated interest rate scenarios we
% generate.  We set our simulation dates to be more frequent at first, then
% turning less frequent further in the future.

% Number of Monte Carlo simulations
numScenarios = 1000;

% Compute monthly simulation dates, then quarterly dates later.
simulationDates = datemnth(ValuationDate,0:3:120);
simulationDates = simulationDates';
numDates = numel(simulationDates);

%% Simulate Scenarios
% For each scenario, we simulate the future interest rate curve at each
% valuation date using the Hull-White one-factor interest rate model.

% Use reproducible random number generator (vary the seed to produce
% different random scenarios).
rng(0);

dt = diff(yearfrac(Settle,simulationDates,1));
nPeriods = numel(dt);
scenarios = HW1F.simTermStructs(nPeriods, ...
    'nTrials',numScenarios, ...
    'deltaTime',dt);


%% Inspect a Scenario
% Create a surface plot of the yield curve evolution for a particular
% scenario.
i = 20;
h=figure(1);
surf(Tenor, simulationDates, scenarios(:,:,i))
%axis tight
datetick y keepticks
xlabel('Tenor, Y');
ylabel('Time, Y');
zlabel('Rates');
ax = gca;
%ax.View = [-49 32];
%title(sprintf('Yield Curve Evolution Scenario\n',i));
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
%saveTightFigure(h,'MertonModel10YYieldEvoluation.pdf')
%% calculate the swap price trajectory
SimSwapPrice = zeros(nPeriods+1,numScenarios);
fixedRate = 0.03;
Maturity = daysadd(Settle,360*10,1);

Basis = 0; 
Principal = 100;
LegRate = [fixedRate 0]; % [CouponRate Spread] 
LegType = [1 0]; % [Fixed Float] 
LegReset = [1 1]; % Payments once per year
RateSpec = toRateSpec(irdc, Settle+30:30:Settle+360*10);

[Price] = swapbyzero(RateSpec,LegRate,Settle, Maturity, LegReset, Basis, Principal, LegType);
SimSwapPrice(1,:,:) = Price;
SimSwapPrice(end,:,:) = 0;


for periodidx=1:nPeriods-1
    simRateSpec = intenvset('StartDate',simulationDates(periodidx),'EndDates',...
        datemnth(simulationDates(periodidx),CurveTimes*12),'Rates',squeeze(scenarios(periodidx+1,:,:)));
    SimSwapPrice(periodidx+1,:) = swapbyzero(simRateSpec,LegRate,simulationDates(periodidx),Maturity)';
end
h=figure(2)
plot(simulationDates,SimSwapPrice)
datetick('x','yy','keeplimits')
ylabel('swap value')
xlabel('Simulation Dates')
%title('Simulated Bond Price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'IRSwapValueTrajectories.pdf')

%% calculate positive mean exposure
exposure = SimSwapPrice;
exposure(exposure < 0) = 0;
MPE = mean(exposure,2);

h=figure(3);
plot(simulationDates,exposure)
datetick('x','yy','keeplimits')
ylabel('positive exposure')
xlabel('Simulation Dates')
%title('Simulated Bond Price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'IRSwapPositiveExposureTrajectories.pdf')


h=figure(4)
plot(simulationDates,MPE,'linewidth',2)
datetick('x','yy','keeplimits')
ylabel('expected positive exposure')
xlabel('Simulation Dates')
%title('Simulated Bond Price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02],'box','on');
set(gca,'Box','on')
pbaspect([1 1 1])
saveTightFigure(h,'IRSwapExpectedPositiveExposure.pdf')
