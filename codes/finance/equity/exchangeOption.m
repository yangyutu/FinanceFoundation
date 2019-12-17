clear all
close all

 Settle = '01-Jun-2012';
 Maturity = '01-Sep-2012';

  Price1 = 120;  
  Vol1 = 0.3;
  
   Price2 = 100;         % $/barrel
   Vol2 = 0.4;
   
  Strike = 0;

StockSpec1 = stockspec(Vol1, Price1);
StockSpec2 = stockspec(Vol2, Price2);

  
rates = 0.01;
Compounding = -1;
Basis = 1;
RateSpec = intenvset('ValuationDate', Settle, 'StartDates', Settle, ...
'EndDates', Maturity, 'Rates', rates, ...
'Compounding', Compounding, 'Basis', Basis)

corrSet = -1:0.1:1;
priceVec = []
for i=1:length(corrSet)
   Corr = corrSet(i);
  OptSpec = 'call';  
  OutSpec = {'Price'}; 
[Price] = spreadsensbykirk(RateSpec, StockSpec1, StockSpec2, Settle, ...
Maturity, OptSpec, Strike, Corr, 'OutSpec', OutSpec)
priceVec = [priceVec; Price]
end

h = figure(1)
plot(corrSet,priceVec,'linewidth',2)
xlabel('correlation')
ylabel('option price')

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h,'exchangeOptionCorrelationPricePlot.pdf')