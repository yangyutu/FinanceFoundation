clear all
close all

S = 50:150;  % spot exchange rate 
X = 100;  % strike 
T = 0:0.4:2; 
r = .02;  % USD interest rate 
sigma = .2; 
for i=1:length(T)
t = T(i);
Price = blsprice(S,X,r,t,sigma,0)
h = figure(1)
hold on
plot(S, Price,'linewidth',2);
end
xlabel('S_0')
ylabel('price')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('T=0.0','T=0.4','T=0.8','T=1.2','T=1.6','T=2.0','Location','northwest')
saveTightFigure(h,'EuropeanCallOptionPrice.pdf')
%% delta
colorSet = jet(8);
for i=1:length(T)
t = T(i)+0.01;
[callDelta,putDelta] = blsdelta(S,X,r,t,sigma)
h = figure(2)
hold on
plot(S, callDelta,'linewidth',2,'color',colorSet(i,:));
%plot(S, putDelta,'linewidth',2,'color',colorSet(i,:));

end
xlabel('S_0')
ylabel('delta')

for i=1:length(T)
t = T(i)+0.01;
[callDelta,putDelta] = blsdelta(S,X,r,t,sigma)
h = figure(2)
hold on
plot(S, putDelta,'linewidth',2,'color',colorSet(i,:));
end
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('T=0.0, C','T=0.4, C','T=0.8, C','T=1.2, C','T=1.6, C','T=2.0, C','T=0.0, P','T=0.4, P','T=0.8, P','T=1.2, P','T=1.6, P','T=2.0, P','Location','northwestoutside')
saveTightFigure(h,'EuropeanCallOptionDelta.pdf')
%% gamma
T(1) = 0.2;
for i=1:length(T)
t = T(i)+0.001;
gamma = blsgamma(S,X,r,t,sigma,0)
h = figure(3)
hold on
plot(S, gamma,'linewidth',2);
end
xlabel('S_0')
ylabel('gamma')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('T=0.2','T=0.4','T=0.8','T=1.2','T=1.6','T=2.0','Location','northwest')
T(1)=0.0;
saveTightFigure(h,'EuropeanCallOptionGamma.pdf')
%% vega
for i=1:length(T)
t = T(i)+0.00001;
vega = blsvega(S,X,r,t,sigma,0)
h = figure(4)
hold on
plot(S, vega,'linewidth',2);
end
xlabel('S_0')
ylabel('vega')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('T=0.0','T=0.4','T=0.8','T=1.2','T=1.6','T=2.0','Location','northwest')
saveTightFigure(h,'EuropeanCallOptionVega.pdf')


%% theta call and put
S = 50:25:150;  % spot exchange rate 
T = 0.1:0.1:2;
T=T+0.001;
for i=1:length(S)
s = S(i);
[theta pTheta] = blstheta(s,X,r,T,sigma)
h = figure(5)
hold on
plot(T, theta,'linewidth',2);
end
xlabel('T')
ylabel('theta')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('S_0=50','S_0=75','S_0=100, ATM','S_0=125','S_0=150','Location','southeast')
saveTightFigure(h,'EuropeanCallOptionTheta.pdf')



S = 50:25:150;  % spot exchange rate 
T = 0.1:0.1:2;
T=T+0.001;
for i=1:length(S)
s = S(i);
[theta pTheta] = blstheta(s,X,r,T,sigma)
h = figure(6)
hold on
plot(T, pTheta,'linewidth',2);
end
xlabel('T')
ylabel('theta')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
legend('S_0=50','S_0=75','S_0=100, ATM','S_0=125','S_0=150','Location','southeast')
saveTightFigure(h,'EuropeanPutOptionTheta.pdf')
