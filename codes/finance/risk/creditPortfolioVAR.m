clear all
close all

lambda = 0.001;
T = 1;
Q = 1 - exp(-lambda*T);
Q = 0.02;
rho = 0.1;
F = -5:0.05:5;
P = normcdf(norminv(Q) - sqrt(rho)*F)/sqrt(1-rho);
plot(F,P)

% significance level 0.001
f = norminv(0.001);
P = normcdf(norminv(Q) - sqrt(rho)*f)/sqrt(1-rho);