clear all
close all


T = [1:0.5:5];
tset = 0:0.01:5;
r=0.02;

for i=1:length(tset)
    time = tset(i);
    j=1;
    while T(j) < time
        j = j + 1;
    end
    if T(j) == time
        V(i) = 100;
    else
        rate = r*0.5;
        DF = 1/(1 + r*(T(j) - time));
        V(i) = 100*(1 + rate)*DF;
    end
end

h1 = figure(1);
plot(tset, V,'linewidth',2)
ylim([90 110])
ylabel('value')
xlabel('time, Year')

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
saveTightFigure(h1,'timePathFloatingRateBond.pdf')
