function [ trees, b_trees ] = diagnostics( Grid )
%UNTITLED8 Summary of this function goes here
%   Diagnostics loops through the whole grid and checks for alive and
%   burning trees.
trees=0;
b_trees=0;
for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==1
            trees=trees+1;
        end
        if Grid(j,k)==3
            b_trees=b_trees+1;
        end
    end
end


end

