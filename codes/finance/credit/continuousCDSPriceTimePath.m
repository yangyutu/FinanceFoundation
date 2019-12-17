clear all
close all


%% time path for a flat hazard rate and short rate

h=0.01;
r=0.02;
R=0.4;
S_fair = (1-R)*h;
C=[0.003 S_fair 0.009];
T=5;
t=0:0.1:5;
hf = figure(1);
for i=1:length(C)
    V(i,:) = ((1-R)*h - C(i)).*(1 - exp(-(r+h).*(T-t)))/(r+h);
    plot(t,V(i,:),'linewidth',2);
    hold on
end
xlabel('time, year')
ylabel('CDS value')
legend('C < S_{fair}', 'C = S_{fair}','C > S_{fair}');
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
set(gca,'box','on')
pbaspect([1 1 1])
saveTightFigure(hf,'continuousCDSTimePath.pdf')
