clear all
close all
clc

% Each step is presented by a matrix : element (i,j) is the cost to go
% from ith element in a step to the jth element of the next step
% graph = {[99 98 102],[101 102 103 nan nan ; nan 103 104 103 nan ; nan nan 103 102 101], [103 nan nan ; 105 103 nan ; 103 106 102 ; nan 104 101 ; nan nan 104 ], [106 ; 105 ; 104]}


% Data for a graph
s = [1 1 1 2 2 2 3 3 3 4 4 4 5  6  6  7  7  7  8  8  9  10 11 12 ];
t = [2 3 4 5 6 7 6 7 8 7 8 9 10 10 11 10 11 12 11 12 12 13 13 13 ];
weights = [ 99 98 102 101 102 103 103 104 103 103 102 101 103 105 103 103 106 102 104 101 104 106 105 104];
names = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M'};

% Defie a graph
G = digraph(s,t,weights,names)
s = 'A'
e = 'M'
[Opt_Path , Opt_Cost] = Find_Opt_Path(G,s,e)

% plot a graph
p = plot(G,'EdgeLabel',G.Edges.Weight);
set(gca,'view',[-90 -90]);

% The shorest path using a dedicated Matlab function
TR = shortestpathtree(G,1,13);
highlight(p,TR,'EdgeColor','r');


[Opt_Path , Opt_Cost] = Find_Opt_Path(G,s,e)
figure
plot(Opt_Path,'EdgeLabel',Opt_Path.Edges.Weight);
set(gca,'view',[-90 -90]);
