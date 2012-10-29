function [ Grid ] = update( Grid )
%UNTITLED4 Summary of this function goes here
%   This function checks ever grid point for being ignited and if, sets it
%   as burning. This is mainly done to prevent updating fragments.
for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==2
            Grid(j,k)=3;
        end
    end
end



end

