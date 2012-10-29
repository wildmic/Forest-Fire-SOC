function [ Grid ] = grow( Grid, growth_rate )
%UNTITLED5 Summary of this function goes here
%   This sub-function loops over all grid cells and grows trees on empty
%   spaces with a probability growth_rate.

for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==0
            x=rand(1,1);
            if x<growth_rate
                Grid(j,k)=1;
            end
        end
    end
end

end

