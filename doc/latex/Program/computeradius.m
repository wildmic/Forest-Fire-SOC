function [Rad] = computeradius(x,y)
global grid;
Rad=0;

    %% New Implementation
    % just check for the condition that the cluster is touching both
    % boundaries; if it does not, stop the loop!
    % check if the cluster stretches from the far left to the far right
    iter=0;
    while(max(x)-min(x)+1==size(grid,1)&& iter<size(grid,1))
        % "flip" the lowest coordinates. They are the boundary cells (check
        % in the while-statement)
        x(ismember(x,min(x)))=x(ismember(x,min(x)))+size(grid,1);
        iter=iter+1;
    end
    % check if the cluster stretches from the top to the bottom
    iter=0;
    while(max(y)-min(y)+1==size(grid,2)&&iter<size(grid,1))
        %flip the lowest coordinates
        y(ismember(y,min(y)))=y(ismember(y,min(y)))+size(grid,2);
        iter=iter+1;
    end
    %do the computation
    x_center=mean(x);
    y_center=mean(y);
    dist=zeros(size(x,1),1);
    for h=1:size(x,1)
        dist(h)=sqrt((x(h)-x_center)^2+(y(h)-y_center)^2);    
    end
    Rad=sqrt(mean(dist.^2));
end