clear 
close all
% %% State Space
A = [0 1; 0 0];
B = [0;1];
C = eye(2);
D = zeros(2,1);
% %%% 

x_0 = [2 2]';

% %%% Commande à énergie minimale 
sys = ss(A,B,C,D);
T = 20;
opt = gramOptions('TimeIntervals',[0 T]);
Wc = gram(sys,'c',opt);
% uk = B'*exp(A*(T-t))/Wc*(xk-exp(A*T)*x_0)
