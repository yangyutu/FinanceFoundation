clear all
close all


Rate = 0.06;
Compounding  = -1;
ValuationDate = 'Jan-1-2010';
EndDates =   'Jan-1-2020'; 
Basis = 1; 

RateSpec = intenvset('ValuationDate', ValuationDate,'StartDates', ValuationDate, ...
'EndDates', EndDates, 'Rates', Rate, 'Compounding', Compounding, 'Basis', Basis);



%% forward starting swap CVA with fair
Settle = 'Jan-1-2011'; % pricing date
ExerciseDates = 'Jan-1-2016'; % swaption execise date and the swap starting date


Maturity = 'Jan-1-2046'; % underlying swap maturity date, this is 30 Y swap
Reset = 2; 
Principal = 100;
Strike = 0.060;
Volatility = 0.2;
OptSpec = 'call';

timeVec = [];
priceVec = [];
negativePriceVec=[];
MeanPE = [];

for i = 1:60
    time = daysadd(ExerciseDates,(i-1)*180);

Price= swaptionbyblk(RateSpec, OptSpec, Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
nePrice= swaptionbyblk(RateSpec, 'put', Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
priceVec = [priceVec; Price];
negativePriceVec = [negativePriceVec; -nePrice];
timeVec = [timeVec; time];
end


h = figure(1);
hold on;
plot(datetime(timeVec,'convertfrom','datenum'),priceVec,'linewidth',2)
plot(datetime(timeVec,'convertfrom','datenum'),negativePriceVec,'linewidth',2)

xtickformat('MM-yyyy')
xlabel('time')
ylabel('discounted mean exposure')
legend('positive','negative','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'interestRateSwapCVA_swaptionMethod_forwardStartingSwap_fairStrike.pdf')

ha = 0.01; % hazard rate
T = ([1:60]-1)*0.5;
S = exp(-ha.*T);% survival probability
R = 0.4; %hazard rate
CVA = sum(S.*ha.*priceVec);




%% forward starting swap CVA with unfair
Settle = 'Jan-1-2011'; % pricing date
ExerciseDates = 'Jan-1-2016'; % swaption execise date and the swap starting date


Maturity = 'Jan-1-2046'; % underlying swap maturity date, this is 30 Y swap
Reset = 2; 
Principal = 100;
Strike = 0.070;
Volatility = 0.2;
OptSpec = 'call';

timeVec = [];
priceVec = [];
negativePriceVec=[];
MeanPE = [];

for i = 1:60
    time = daysadd(ExerciseDates,(i-1)*180);

Price= swaptionbyblk(RateSpec, OptSpec, Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
nePrice= swaptionbyblk(RateSpec, 'put', Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
priceVec = [priceVec; Price];
negativePriceVec = [negativePriceVec; -nePrice];
timeVec = [timeVec; time];
end


h = figure(2);
hold on;
plot(datetime(timeVec,'convertfrom','datenum'),priceVec,'linewidth',2)
plot(datetime(timeVec,'convertfrom','datenum'),negativePriceVec,'linewidth',2)

xtickformat('MM-yyyy')
xlabel('time')
ylabel('discounted mean exposure')
legend('positive','negative','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'interestRateSwapCVA_swaptionMethod_forwardStartingSwap_unfairStrike.pdf')


ha = 0.01; % hazard rate
T = ([1:60]-1)*0.5;
S = exp(-ha.*T);% survival probability
R = 0.4; %hazard rate
CVA = sum(S.*ha.*priceVec);

%% spot starting swap CVA with fair strike
Settle = 'Jan-1-2016'; % pricing date
ExerciseDates = 'Jan-1-2016'; % swaption execise date and the swap starting date


Maturity = 'Jan-1-2046'; % underlying swap maturity date, this is 30 Y swap
Reset = 2; 
Principal = 100;
Strike = 0.060;
Volatility = 0.2;
OptSpec = 'call';

timeVec = [];
priceVec = [];
negativePriceVec=[];
MeanPE = [];

for i = 1:60
    time = daysadd(ExerciseDates,(i-1)*180);

Price= swaptionbyblk(RateSpec, OptSpec, Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
nePrice= swaptionbyblk(RateSpec, 'put', Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
priceVec = [priceVec; Price];
negativePriceVec = [negativePriceVec; -nePrice];
timeVec = [timeVec; time];
end


h = figure(3);
hold on;
plot(datetime(timeVec,'convertfrom','datenum'),priceVec,'linewidth',2)
plot(datetime(timeVec,'convertfrom','datenum'),negativePriceVec,'linewidth',2)

xtickformat('MM-yyyy')
xlabel('time')
ylabel('discounted mean exposure')
legend('positive','negative','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'interestRateSwapCVA_swaptionMethod_spotStartingSwap_fairStrike.pdf')


ha = 0.01; % hazard rate
T = ([1:60]-1)*0.5;
S = exp(-ha.*T);% survival probability
R = 0.4; %hazard rate
CVA = sum(S.*ha.*priceVec);



%% spot starting swap CVA with unfair strike
Settle = 'Jan-1-2016'; % pricing date
ExerciseDates = 'Jan-1-2016'; % swaption execise date and the swap starting date


Maturity = 'Jan-1-2046'; % underlying swap maturity date, this is 30 Y swap
Reset = 2; 
Principal = 100;
Strike = 0.070;
Volatility = 0.2;
OptSpec = 'call';

timeVec = [];
priceVec = [];
negativePriceVec=[];
MeanPE = [];

for i = 1:60
    time = daysadd(ExerciseDates,(i-1)*180);

Price= swaptionbyblk(RateSpec, OptSpec, Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
nePrice= swaptionbyblk(RateSpec, 'put', Strike, Settle, time, Maturity, ...
Volatility, 'Reset', Reset, 'Principal', Principal, 'Basis', Basis);
priceVec = [priceVec; Price];
negativePriceVec = [negativePriceVec; -nePrice];
timeVec = [timeVec; time];
end


h = figure(4);
hold on;
plot(datetime(timeVec,'convertfrom','datenum'),priceVec,'linewidth',2)
plot(datetime(timeVec,'convertfrom','datenum'),negativePriceVec,'linewidth',2)

xtickformat('MM-yyyy')
xlabel('time')
ylabel('discounted mean exposure')
legend('positive','negative','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'interestRateSwapCVA_swaptionMethod_spotStartingSwap_unfairStrike.pdf')


ha = 0.01; % hazard rate
T = ([1:60]-1)*0.5;
S = exp(-ha.*T);% survival probability
R = 0.4; %hazard rate
prob = S.*ha;
CVA = sum(S.*ha.*priceVec);

h = figure(5);
plot(datetime(timeVec,'convertfrom','datenum'),prob,'linewidth',2); 
xlabel('time')
ylabel('default probability')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([3 1 1])
saveTightFigure(h,'interestRateSwapCVA_swaptionMethod_defaultProbabilityCurve.pdf')
