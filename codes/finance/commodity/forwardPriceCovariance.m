clear all
close all

N = 100;
corr0 = zeros(N,N);

dist = 500;

for i=1:N
    for j=1:N
        corr0(i,j) = exp(-(i-j)^2/(dist + 20*i + 20*j + 6*i^2 + 6*j^2));
    end
end

h=figure(1)
imagesc(corr0)
xlabel('expiry month index')
ylabel('expiry month index')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
colorbar

%saveTightFigure(h,'forwardPriceCorrelation.pdf')


T = 1:N;
sigma = 0.3*exp(-T./20)+0.2;
h=figure(2)
plot(T,sigma,'linewidth',2)
xlabel('expiry month index')
ylabel('volatility \sigma')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'forwardPriceVolatility.pdf')

cov = corr0;

for i=1:N
    for j=1:N
        cov(i,j) = cov(i,j)*sigma(i)*sigma(j);
    end
end
h=figure(3)
imagesc(cov)
xlabel('expiry month index')
ylabel('expiry month index')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
colorbar
%saveTightFigure(h,'forwardPriceCovariance.pdf')

[U,S,V] = svd(corr0);
h=figure(4);
plot(T,U(:,1),'linewidth',2)
hold on
plot(T,U(:,2),'linewidth',2)
plot(T,U(:,3),'linewidth',2)
xlabel('expiry month index')
ylabel('values')
legend('PC1','PC2','PC3','location','southeast')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'forwardPricePCfactors.pdf')