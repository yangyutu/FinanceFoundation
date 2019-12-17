clear all
close all

Settle = '17-Jul-2009'; % valuation date for the CDS
Zero_Time = [.5 1 2 3 4 5]';


ProbData = [daysadd(datenum(Settle),360,1), 0.1247;
daysadd(datenum(Settle),360*2,1), 0.3447;
daysadd(datenum(Settle),360*3,1), 0.4647;
daysadd(datenum(Settle),360*4,1), 0.7847;
daysadd(datenum(Settle),360*5,1), 0.9047
];
Maturity = '20-Sep-2015';
ContractSpread = 135;
datestr(ProbData(:,1))


spread = 0.01:0.01:0.1;
price_vec = []
for i=1:length(spread)
Zero_Rate = [1.35 1.43 1.9 2.47 2.936 3.311]'/100 + spread(i);
Zero_Dates = daysadd(Settle,360*Zero_Time,1);
ZeroData = [Zero_Dates Zero_Rate];

[Price,AccPrem] = cdsprice(ZeroData,ProbData,Settle,Maturity,ContractSpread);

price_vec = [price_vec; Price];
end
h=figure(1)
subplot(2,1,1)
plot(spread, price_vec,'linewidth',2)
ylabel('CDS price')
xlabel('parallel shift of zero rate')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([3 1 1])

ProbData = [daysadd(datenum(Settle),360,1), 0.01;
daysadd(datenum(Settle),360*2,1), 0.011;
daysadd(datenum(Settle),360*3,1), 0.012;
daysadd(datenum(Settle),360*4,1), 0.013;
daysadd(datenum(Settle),360*5,1), 0.014
];


spread = 0.01:0.01:0.1;
price_vec = []
for i=1:length(spread)
Zero_Rate = [1.35 1.43 1.9 2.47 2.936 3.311]'/100 + spread(i);
Zero_Dates = daysadd(Settle,360*Zero_Time,1);
ZeroData = [Zero_Dates Zero_Rate];

[Price,AccPrem] = cdsprice(ZeroData,ProbData,Settle,Maturity,ContractSpread);

price_vec = [price_vec; Price];
end
figure(1)

subplot(2,1,2)
plot(spread, price_vec,'linewidth',2)
ylabel('CDS price')
xlabel('parallel shift of zero rate')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([3 1 1])

saveTightFigure(h,'CDSpriceInterestRateEffect.pdf')

