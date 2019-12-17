clear all
close all

Settle = '17-Jul-2009'; % valuation date for the CDS
N=73;
Zero_Time = [.5 1 2 3 4 5]';


ProbData = [daysadd(datenum(Settle),360,1), 0.01247;
daysadd(datenum(Settle),360*2,1), 0.03447;
daysadd(datenum(Settle),360*3,1), 0.04647;
daysadd(datenum(Settle),360*4,1), 0.07847;
daysadd(datenum(Settle),360*5,1), 0.09047
];
Maturity = '20-Sep-2015';
ContractSpread = 135;
datestr(ProbData(:,1))


spread = 0.01:0.01:0.1;
price_vec = []
timeVec = [];
for i=1:N
Zero_Rate = [1.35 1.43 1.9 2.47 2.936 3.311]'/100;
Zero_Dates = daysadd(Settle,360*Zero_Time,1);
ZeroData = [Zero_Dates Zero_Rate];
time = daysadd(datenum(Settle),i*29,1);

[Price,AccPrem] = cdsprice(ZeroData,ProbData,time,Maturity,ContractSpread);
timeVec = [timeVec;time];
price_vec = [price_vec; Price];
end
h=figure(1)

plot(datetime(timeVec,'convertfrom','datenum'), price_vec,'linewidth',2)
ylabel('CDS clean price')

xlabel('time')
xtickformat('yyyy')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);


saveTightFigure(h,'CDSCleanpriceTimePath.pdf')



ProbData = [daysadd(datenum(Settle),360,1), 0.1247;
daysadd(datenum(Settle),360*2,1), 0.13447;
daysadd(datenum(Settle),360*3,1), 0.14647;
daysadd(datenum(Settle),360*4,1), 0.14847;
daysadd(datenum(Settle),360*5,1), 0.84947
];
Maturity = '20-Sep-2015';
ContractSpread = 135;
datestr(ProbData(:,1))


spread = 0.01:0.01:0.1;
price_vec = []
timeVec = [];
for i=1:N
Zero_Rate = [1.35 1.43 1.9 2.47 2.936 3.311]'/100;
Zero_Dates = daysadd(Settle,360*Zero_Time,1);
ZeroData = [Zero_Dates Zero_Rate];
time = daysadd(datenum(Settle),i*29,1);

[Price,AccPrem] = cdsprice(ZeroData,ProbData,time,Maturity,ContractSpread);
timeVec = [timeVec;time];
price_vec = [price_vec; Price];
end
h=figure(2)

plot(datetime(timeVec,'convertfrom','datenum'), price_vec,'linewidth',2)
ylabel('CDS clean price')

xlabel('time')
xtickformat('yyyy')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);


saveTightFigure(h,'CDSCleanpriceTimePath2.pdf')