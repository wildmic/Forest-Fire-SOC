function [cSize,cRadius,N] = diagnostics ()
% The diagnostics function can work independantly of the simulation, it
% does not in any way alter the grid or the shadow grid nor the Index
% Matrix.
% It computes the current Number of alive trees, a vector containing the
% cluster sizes and a vector containing the cluster radii.
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
    
    % retrieve cluster index 
    ind=Index(1,cIndex(i));
    % The matrix cluster is a Matrix with the same size as the grid, but is
    % zero everywhere except the grid points where trees with the current
    % index are (value=1);
    cluster=ismember(shgrid,ind);
    % find cluster size
    
    cSize(i)=sum(sum(cluster));
    % x and y give the coordinates of the cluster cells.
    [x,y]=find(cluster);
    % x_center and y_center are the center of the cluster
    x_center=mean(x);
    y_center=mean(y);
    % initialize the distance vector as zero
    dist=zeros(size(x,1),1);
    % for every cluster cell, compute its distance to the cluster center
    for h=1:size(x)
        dist(h)=sqrt((x(h)-x_center)^2+(y(h)-y_center)^2);
    end
    % compute the cluster radius as the mean of all radii.
    cRadius(i)=round(mean(dist));
    
end
% This step is necessary to make the above loop suitable for parallel
% execution. Otherwise, one could just have written for i=cIndex.
% Here, we find all non-zero entries in the cRadius and cSize vectors and
% condense them into smaller vectors which hold no zero-elements.
temp=find(cIndex);
cRadius=cRadius(temp);
cSize=cSize(temp);
    