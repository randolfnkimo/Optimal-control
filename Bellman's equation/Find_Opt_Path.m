function [Opt_Path , Opt_Cost] = Find_Opt_Path(G,s,e)
%  Find the best path in a grpah using the Dynamic Programming. 
%  The graph is supposed to have one start point and one end point
%  It suposed not to have loops
%  Also and at each stage there should be no edges between nodes (only edges to the next stage)
  

% Reduced Graph by removing the end 
red_G = rmnode(G, e);

% Empty structures to fill with optimal trajectories and optimal cost via
% sucessor i till (from s to e) 

Paths = {};
Costs = [];

% IDs of sucessor nodes
sucIDs = predecessors(G,e)

% For all sucessor nodes
for i =1:length(sucIDs)

    Suc_i = sucIDs{i};
    Cost_i_to_e = G.Edges.Weight(findedge(G,Suc_i,e));

    if Suc_i == s    
        
        Opt_Cost = Cost_i_to_e;
        Opt_Path = digraph(Suc_i,e,Cost_i_to_e);
        return;

    else

       [Opt_Path_To_i , Opt_Cost_To_i] = Find_Opt_Path(red_G,s,Suc_i);

       Paths{end+1} = addedge(Opt_Path_To_i,Suc_i,e,Cost_i_to_e)  ;
       Costs(end+1) = Opt_Cost_To_i + Cost_i_to_e;

    end
    
end

    [Opt_Cost,arg_min] = min(Costs);
     Opt_Path = Paths{arg_min}

end

