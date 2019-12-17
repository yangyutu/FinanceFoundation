clear all
close all

rng(1)
%dX_t = speed(level - X_t)dt + sigma X_t^{1/2}dW_t
r0=0.02;
SDE = cir(0.02, 0.02, 0.002,'startstate',r0);  % (Speed, Level, Sigma)
ntrials  = 10;
nPeriods = 359;      % # of simulated observations
dt       = 1 / 12;      % time increment = 1/100 Y
rng(142857,'twister')

[R,T] = simulate(SDE, nPeriods, 'DeltaTime', dt,'nTrials', ntrials);
for i=1:10
    h=figure(1);
    hold on;
    plot(T,R(:,:,i),'linewidth',2);
end