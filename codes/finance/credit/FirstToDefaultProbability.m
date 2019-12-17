clear all
close all

nIssuers = 10;
T = 0:0.1:5;
DefProb = zeros(nIssuers,length(T));
for ii = 1:nIssuers
   lambda = 0.01 + randn*0.002;
   DefProb(ii,:) = 1 - exp(-lambda*T);
end
ProbDates = T';
%%
% These are the calibrated default probability curves for each credit in
% the basket.

figure(1)
plot(T,DefProb)
datetick
%title('Individual Default Probability Curves')
ylabel('cumulative probability on default time')
xlabel('time, year')

DefThresh = norminv(DefProb);

%% Derive Survival Curve for the Basket
beta = sqrt(0.25)*ones(nIssuers,1);
nProbDates = length(ProbDates);
FTDSurvProb = zeros(size(ProbDates));
for jj = 1:nProbDates
   % vectorized conditional probability as a function of Z
   vecCondProb = @(Z)prod(normcdf(bsxfun(@rdivide,...
      -repmat(DefThresh(:,jj),1,length(Z))+bsxfun(@times,beta,Z),...
      sqrt(1-beta.^2))));
   % truncate domain of normal distribution to [-5,5] interval
   FTDSurvProb(jj) = integral(@(Z)vecCondProb(Z).*normpdf(Z),-5,5);
end
FTDDefProb = 1-FTDSurvProb;

%%
% Compare the FTD probability to the default probabilities of the
% individual issuers.

h= figure(1)
plot(ProbDates',DefProb)
datetick
hold on
plot(ProbDates,FTDDefProb,'LineWidth',3,'color','black')
datetick
hold off
ylabel('cdf on default time')
xlabel('time, year')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'FirstDefaultTimeDemo1.pdf')
%title('FTD and Individual Default Probability Curves')

%% Analyze Sensitivity to Correlation
%
% To illustrate the sensitivity of the FTD spreads to model parameters, we
% calculate the market spreads for a range of correlation values.

corr = [0 0.25 0.5 0.75 0.90 1];

for ii = 1:length(corr)
   beta = sqrt(corr(ii))*ones(nIssuers,1);
   FTDSurvProb = zeros(length(ProbDates),1);
   for jj = 1:nProbDates
      % vectorized conditional probability as a function of Z
      condProb = @(Z)prod(normcdf(bsxfun(@rdivide,...
         -repmat(DefThresh(:,jj),1,length(Z))+bsxfun(@times,beta,Z),...
         sqrt(1-beta.^2))));
      % truncate domain of normal distribution to [-5,5] interval
      FTDSurvProb(jj) = integral(@(Z)condProb(Z).*normpdf(Z),-5,5);
   end
   FTDDefProb = 1-FTDSurvProb;
   h=figure(10)
   hold on
  plot(ProbDates,FTDDefProb,'LineWidth',3)
datetick
end
ylabel('cdf on default time')
xlabel('time, year')
legend('\rho = 0','\rho = 0.25','\rho = 0.5','\rho = 0.75','\rho = 0.9','\rho = 1','location','northwest')
set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
set(gca,'box','on')
saveTightFigure(h,'FirstDefaultTimeDemo2_differentCorrelations.pdf')
