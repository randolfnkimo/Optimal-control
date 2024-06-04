close all;
clear all;
clc

Ts = 1;
Num = [0 1];
Den = [1 1 0];
sys = tf(Num,Den,Ts);
state_space=ss(sys);
A = state_space.A;
B = state_space.B;
C = state_space.C;
D = state_space.D;

x_0 = [8 -5]';

Q = [2 0; 1 0]; 
R =  1/2;
P = eye(2);

umax = 1; 
umin = -1;

ymin = -10; 
ymax = +10;

% %% Test exemple du cours 
% A = [1 1; 0 1];
% B = [0;1];
% C = [1 0];
% Q = [1 0; 0 0]; 
% R =  1/10;
% P = eye(2);
% %% Fin test

N = 10;
 
% %%%%%%%%%%%%%%%%%%%%%
T_ =[];
S_ = [];
R_ = diag(repmat(R, 1, N));

for i=1:N
 for j=1:N
    k = i-j;
 if k<0
    s_(:,j) = zeros(2,1);
 else
    s_(:,j) = A^k*B;
 end
 end
 S_ = [S_;s_];
end

for i=1:N
T_ = [T_; A^i];
end
% %% Calcul de Q_

% Q_ = zeros(2*N);
% for i=1:2*N
%     Q_(i, i) = Q(mod(i - 1, size(Q, 1)) + 1, mod(i - 1, size(Q, 2)) + 1);
% end
% Q_(end-1:end,end-1:end) = P;

sizeQ_ = [2*N-2, 2*N-2]; %
nb_Q = sizeQ_(1)/size(Q, 1);
Q_ = blkdiag(kron(eye(nb_Q), Q), P);
% %% Fin Calcul Q_

H = 2*(S_'*Q_*S_+ R_);
F = (2*T_'*Q_*S_)';
Y = 2*(T_'*Q_*T_+Q);
% %%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%
G = kron(eye(N),eye(1));
G = [G;kron(eye(N),-eye(1))];
G_ = [];
for i=1:N
 for j=1:N
    k = i-j;
 if k<0
    g_(:,j) = 0;
 else
    g_(:,j) = C*A^k*B;
 end
 end
 G_ = [G_;g_];
end
G = [G;G_;-G_];
% %% Fin Calcul G 

% %% Calcul W 
W = [umax*ones(N,1);-umin*ones(N,1);ymax*ones(N,1);-ymin*ones(N,1)];
% %% Fin Calcul W

% %% Calcul S 
S = [zeros(2*N,2)];
s1=[];
for i=1:N
  s1 = [s1; C*A^i];
end
S = [S; -s1; s1];
% %% Fin Calcul S
%%%%%%%%%%%%%%%%%%%%

