clear all
close all

%% first study how parameters affects the yield curve
% k is the speed of mean reversion
% r_bar is the risk-neutral long run mean of the short rate
% sigma is the volatility of the short rate
% Our model is dr(t)=k(r_bar-r(t))dt+sigma*dW, where dW is a Brownian
% motion.
% r is the current short rate at time t
rng(1)

T=0:0.1:30; % tensor
r0=.02;
dT = T(2) - T(1);
%% zero-coupon bond of different maturities price evoluation single trajectory

k=.3;
r_bar=.04;
sigma=.03;

B=(1-exp(-k.*T))/k;
A=(r_bar-sigma^2/(2*k^2))*(B-T)-(sigma^2*B.^2)/(4*k);

y0=B*r0./T - A./T;
h=figure(6)
hold on
%plot(T,y0,'linewidth',2,'color','black');
MaturitySet = [10,20,30];
randnSet = randn(1000,1);
for i=1:length(MaturitySet)
    maturity = MaturitySet(i);
    % simulate short rate to different maturities
    stepSize = 0.1;
    N = maturity/stepSize
    r_old = r0;
    P_traj = [];
    P_traj = [P_traj; exp(-y0(maturity/dT)*maturity)]; %get the initial price
    for j = 1 : N
        r_new = r_old + stepSize * k * (r_bar - r_old) + sigma *sqrt(stepSize) * randnSet(j);%we need to use the same random number in overlapping regions
        y1 = B*r_new./T - A./T;
        P = exp(-y1(maturity/dT)*(maturity-stepSize*j));
        P_traj = [P_traj; P];
        r_old = r_new;
    end
    
    plot([0 [1:N]*stepSize],P_traj,'linewidth',2);

end


xlabel('time t, year')
ylabel('price')
ylim([0,1.1])
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
legend('P(t,10Y)','P(t,20Y)','P(t,30Y)','location','southeast')
saveTightFigure(h,'VasicekModelZCBPriceTrajectory.pdf')