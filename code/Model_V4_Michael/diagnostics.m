function [cSize,cRadius,N] = diagnostics ()
global grid;
global shgrid;
global Index;
% retrieve number of trees alive
N=sum(sum(grid));
% retrieve all used indices
cIndex=find(Index(2,:));

% initialize size vector
cSize=zeros(size(cIndex,2),1);
% initialize radius vector
cRadius=zeros(size(cIndex,2),1);
%counter variable for the output

for i=1:size(cIndex,2);
    
    % retrieve cluster index and retrieve clean matrix
    ind=Index(1,cIndex(i));
    cluster=ismember(shgrid,ind);
    % find cluster size
    
    cSize(i)=sum(sum(cluster));
    [x,y]=find(cluster);
    x_center=mean(x);
    y_center=mean(y);
    dist=zeros(size(x,1),1);
    for h=1:size(x)
        dist(h)=sqrt((x(h)-x_center)^2+(y(h)-y_center)^2);
    end
    cRadius(i)=round(mean(dist));
    
end
temp=find(cIndex);
cRadius=cRadius(temp);
cSize=cSize(temp);
    