clear all
close all


Yieldvec = [0.04; 0.05; 0.06]; 
%Yield = 0.04;
CouponRate = 0.05; 
Settle = '20-Jan-1997'; 
time = daysadd(Settle,30);
Maturity = '15-Jun-2002'; 
Period = 2; 
Basis = 0; 

for j=1:length(Yieldvec)
Yield = Yieldvec(j);
    
price_vec=[];
acInt_vec=[];
time_vec=[];
for i=1:70
time_diff = (i-1)*30;
time = daysadd(Settle,time_diff);
datestr(time);
endflag = 0;
if time > datenum(Maturity)
    time = datenum(Maturity)-1;
    endflag = 1; % approaching the end, we should set accu interest to 0
end

[Price, AccruedInt] = bndprice(Yield, CouponRate, time,Maturity, Period, Basis);
if endflag
    AccruedInt = 0;
end

price_vec=[price_vec; Price];


acInt_vec=[acInt_vec;AccruedInt];
time_vec=[time_vec;time];
end
%about datetime conversion https://www.mathworks.com/help/matlab/matlab_prog/convert-between-datetime-arrays-numbers-and-strings.html#bth57t1-1
h = figure(1);
plot(datetime(time_vec,'convertfrom','datenum'),price_vec,'linewidth',2)
xtickformat('MM-yyyy')
figure(1)
hold on;
plot(datetime(time_vec,'convertfrom','datenum'),price_vec+acInt_vec,'linewidth',2)
xtickformat('MM-yyyy')
ylim([90,110])
ylabel('bond price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])

end

h2 = figure(2);
plot(datetime(time_vec,'convertfrom','datenum'),acInt_vec,'linewidth',2)
xtickformat('MM-yyyy')
ylim([0 10])
ylabel('accrued interest')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])


[CFlowAmounts,CFlowDates,TFactors,CFlowFlags,CFPrincipal] = cfamounts(CouponRate,Settle,Maturity);
saveTightFigure(h,'timePathBond.pdf')
saveTightFigure(h2,'timePathBondInterest.pdf')
