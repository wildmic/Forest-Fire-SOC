function [ Grid ] = grow( Grid, growth_rate )
%UNTITLED5 Summary of this function goes here
%   This sub-function loops over all grid cells and grows trees on empty
%   spaces with a probability growth_rate.
% this Version of the grow function has patch-grow implemented which
% reflects reality much better than just random growth of trees. It
% technically means that a tree can grow at the edge of an already existing
% forest (patch of trees) or, with much lower probability, anywhere. This
% Feature helps to build natural barriers common in reality, which prevent
% big fires as long as the patches are not connected. The patches will
% connect however, if they get too big (meaning that no fire has occurred
% for a longer period).

for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==0
            x=rand(1);
            if x<growth_rate
            [a,b,c,d,e,f,g,h]=neighbor(j,k,size(Grid,1),size(Grid,2));
            %check if any of the neighbors is a tree
                if (Grid(a,b)==1 || Grid(c,d)==1 || Grid(e,f)==1 || Grid(g,h)==1)
                    Grid(j,k)=1;
                else
                    y=rand(1);
                    if y<growth_rate/500
                        Grid(j,k)=1;
                    end
                end
          
            end
        end
    end
end

end

