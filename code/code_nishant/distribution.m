function [trees,empty,fires]=distribution(Forest_grid,Nd)
% This function is compatible with function basic_fire_model_smaller and basic_fire_model_smaller2 only 
%This function calculates the number of empty sites, number of trees and
%number of fires in a forest_grid where they are represented by the
%following values:
%0-tree
%1-empty site
%2-fire
trees=0;
empty=0;
fires=0;
i=2;
while i<Nd
    j=2;
    while j<Nd
        if Forest_grid(i,j)==0
            trees=trees+1;
        elseif Forest_grid(i,j)==1
            empty=empty+1;
        else
            fires=fires+1;
        end
        j=j+1;
    end
    i=i+1;
end
end