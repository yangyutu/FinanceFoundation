clear all
close all


Yieldvec = [0.02; 0.05; 0.068]; 
%Yield = 0.04;
CouponRate = 0.05; 
Settle = '20-Jan-2017'; 
time = daysadd(Settle,30);
Maturity = '15-Jun-2022'; 
Period = 2; 
Basis = 0; 

for j=1:length(Yieldvec)
Yield = Yieldvec(j);
    
dur_vec=[];
conv_vec=[];
acInt_vec=[];
time_vec=[];
for i=1:20
time_diff = (i-1)*265;
time = daysadd(Maturity,time_diff);
datestr(time)


%[ModDuration,YearDuration,PerDuration] = bnddury(Yield, CouponRate, Settle, time, Period, Basis);
[YearConvexity, PerConvexity]=bndconvy(Yield, CouponRate,Settle, time, Period, Basis);
%dur_vec=[dur_vec; ModDuration];
conv_vec=[conv_vec; YearConvexity];
time_vec=[time_vec;time];
end
%about datetime conversion https://www.mathworks.com/help/matlab/matlab_prog/convert-between-datetime-arrays-numbers-and-strings.html#bth57t1-1
h = figure(1);
hold on
plot(datetime(time_vec,'convertfrom','datenum'),conv_vec,'linewidth',2)
xlabel('maturity')
ylabel('convexity')
xtickformat('yyyy')
figure(1)
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([2 1 1])
legend('y=0.02','y=0.05','y=0.08','Location','northwest')
end
saveTightFigure(h,'bondConvexityVsYieldVsMaturity.pdf')



couponSet = [0.02, 0.05, 0.08]
for j=1:length(couponSet)
CouponRate = couponSet(j);
    
dur_vec=[];
conv_vec=[];
acInt_vec=[];
time_vec=[];
for i=1:20
time_diff = (i-1)*265;
time = daysadd(Maturity,time_diff);
datestr(time)


%[ModDuration,YearDuration,PerDuration] = bnddury(Yield, CouponRate, Settle, time, Period, Basis);
[YearConvexity, PerConvexity]=bndconvy(Yield, CouponRate,Settle, time, Period, Basis);
%dur_vec=[dur_vec; ModDuration];
conv_vec=[conv_vec; YearConvexity];
time_vec=[time_vec;time];
end
%about datetime conversion https://www.mathworks.com/help/matlab/matlab_prog/convert-between-datetime-arrays-numbers-and-strings.html#bth57t1-1
h = figure(2);
hold on
plot(datetime(time_vec,'convertfrom','datenum'),conv_vec,'linewidth',2)
xlabel('maturity')
ylabel('convexity')
xtickformat('yyyy')
figure(2)
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([2 1 1])
legend('c=0.02','c=0.05','c=0.08','Location','northwest')
end
saveTightFigure(h,'bondConvexityVsYieldVsCouponRate.pdf')
