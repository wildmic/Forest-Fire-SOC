function [ Grid ] = erase( Grid )
%UNTITLED6 Summary of this function goes here
%   Erase checks for burning trees on the grid and sets them back to State
%   0.

for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==3
            Grid(j,k)=0;
        end
    end
end


end

