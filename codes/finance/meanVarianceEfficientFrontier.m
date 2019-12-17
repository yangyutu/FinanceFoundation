clear all
close all

u = [0.06;0.02;0.04];
V = 1e-3*[8.0 -2.0 4.0; -2.0 2.0 -2.0; 4.0 -2.0 8.0];
rf = 0.01;

x1=[1;1;1]/3;

x1'*u

(x1'*V*x1)^0.5

Aeq = [1 1 1];
beq = 1;

fobj = @(x)x'*V*x;
[x fval] = fmincon(fobj,[1,0,0]',[],[],Aeq,beq);

sigmamin = x;
x'*u;
% this is calculating the sharpo optimal portfolo for question 4
fobj = @(x)-(x'*u -rf)/(x'*V*x)^0.5;

[x fval] = fmincon(fobj,[1,0,0]',[],[],Aeq,beq);
x'*u
(x'*V*x)^0.5

rf + -fval*0.05

%% construct the mean-variance profile

u = [0.06;0.02;0.04]; %mean return vector for three assets
V = 1e-3*[8.0 -2.0 4.0; -2.0 2.0 -2.0; 4.0 -2.0 8.0]; %covariance matrix
rf = 0.01; % risk free rate
uset = 0.5e-2:0.5e-2:1e-1;
for i=1:length(uset)
    fobj=@(x)x'*V*x;
    Aeq = [1 1 1;u'];
    beq = [1;uset(i)];
    [x fval] = fmincon(fobj,[1,0,0]',[],[],Aeq,beq);
    sigma_min_set(i)=fval;
end
h=figure
plot(sigma_min_set,uset,'linewidth',2,'color','black')
xlabel('\sigma^2')
ylabel('\mu')

set(gca,'linewidth',2,'fontsize',15,'fontweight','bold','plotboxaspectratiomode','auto','xminortick','on','yminortick','on','TickLength',[0.04;0.02]);
pbaspect([1 1 1])
%hold on
%plot(sigma_min_set,sigma_min_set);

saveTightFigure(h,'mean.pdf')