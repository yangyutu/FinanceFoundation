clear all
close all

irfc = IRFunctionCurve('Forward',today,@(t) 0.02,'compounding',-1)

dates = daysadd(today,floor(360*[0.1:0.1:30]),0);

F = getForwardRates(irfc,dates);
DF = getForwardRates(irfc,dates);
Zeros = getZeroRates(irfc,dates);
