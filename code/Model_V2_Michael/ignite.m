function [ Grid ] = ignite (Grid)
%% [ignite] 
% takes the grid and loops over all grid cells. It first assesses if a
% single tree should be lit randomly, and then checks every tree for
% burning neighbours.

%loop over horizontal cell array
for j=1:size(Grid,1)   
    %loop over vertical cell array
    for k=1:size(Grid,2)
        %check if grid cell has tree
        if Grid(j,k)==1
            p=0;
            %return 1st order moore neighbor coordinates
            [a,b,c,d,e,f,g,h]=neighbor(j,k,size(Grid,1),size(Grid,2));
            %check if any of the neighbors is burning
            %if (Grid(a,b)==3 || Grid(c,d)==3 || Grid(e,f)==3 || Grid(g,h)==3)
                %if a neighbor is burning, set current grid cell as burning
             %   x=rand(1);
              %  if x<1
               %     Grid(j,k)=2;
                %end
            %end
            if (Grid(a,b)==3)
                p=p+1;
            end
            if (Grid(c,d)==3)
                p=p+1;
            end
            if (Grid(e,f)==3)
                p=p+1;
            end
            if (Grid(g,h)==3)
                p=p+1;
            end
            if p==1
                p=0.6;
            elseif p==2
                p=0.9;
            elseif p==3;
                p=0.96;
            end
            x=rand(1);
            if x<p
                Grid(j,k)=2;
            end
                
        end
    end
end
