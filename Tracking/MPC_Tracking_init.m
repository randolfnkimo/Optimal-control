close all;
clear;
clc
 
A = [-1 0; 1 0];
B = [1;0];
C = [0,1];
D = 0;
x_0 = [8 -5]';

Ts = 1; 
N = 10;  

Q = 4; 
R = 1;

% %%% Definition de la nouvelle dynamique du système
A_ = [A B; zeros(1,2), eye(1)];
B_ = [B;eye(1)];
C_ = [C, zeros(1)];

umax = 2;
umin =-2;

delta_umax = 1;
delta_umin =-1;

% %%% Calcul de Q_
P = C_'*zeros(1,1)*C_;
q = C_'*Q*C_;
sizeQ_ = [3*N-3, 3*N-3]; %
nb_Q = sizeQ_(1)/size(q, 1);
Q_ = blkdiag(kron(eye(nb_Q), q), P);
% %%% Fin Calcul Q_

% %% Calcul de T_
T_ = blkdiag(kron(eye(9), Q*C_), zeros(1,1)*C_);
% %% Fin Calcul T_

% %%% Calcul de R_
R_ = diag(repmat(R, 1, N));
% %%% Fin Calcul R_

% %%% Calcul de S_
S_ =[];
for i=1:N
 for j=1:N
    k = i-j;
 if k<0
    s(:,j) = zeros(3,1);
 else
    s(:,j) = A_^k*B_;
 end
 end
 S_ = [S_;s];
end
% %%% Fin Calcul S_

% %%% Calcul de K_
K_=[];
for i=1:N
K_ = [K_; A_^i];
end
% %%% Fin Calcul K_

%%%%%%%%%%%%%%%%%%%%%%
H = S_'*Q_*S_ + R_;
F = 2*[K_'*Q_*S_; -T_*S_]';
%%%%%%%%%%%%%%%%%%%%%%

% %%% Calcul de G
G = kron(eye(N),eye(1));
G = [G;kron(eye(N),-eye(1))];

%c_ = repmat([0 0 1], 1, N)
%c_ = kron(eye(N), [0 0 1]);
%g_ = eye(N,N)+c_*S_;
%G = [G; g_; -g_];

% %%% FilnCalcul de G 
%%%%%%%%%%%%%%%%%%%%
%W = [delta_umax*ones(N,1);-delta_umin*ones(N,1); umax*ones(N,1);umin*ones(N,1)];
W = [delta_umax*ones(N,1);-delta_umin*ones(N,1)];
S = [zeros(2*N,3)];
%s_ = c_*K_;
%S = [S;-s_;s_];
%%%%%%%%%%%%%%%%%%%%