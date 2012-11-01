function [ Grid ] = grow( Grid, growth_rate )
%UNTITLED5 Summary of this function goes here
%   This sub-function loops over all grid cells and grows trees on empty
%   spaces with a probability growth_rate.

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

