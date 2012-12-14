function [] = clusterburn(x,y)
% clusterburn takes the grid coordinates to be burned and resets the entire
% connected cluster
global Index
global grid
global shgrid
% retrieve the local cluster index
locind=shgrid(x,y);
% if the current local index is zero, then an error must have occurred,
% since it should always be greater than one. Otherwise, no tree should be
% at this position and the function should not have been called in the
% first place!
if locind==0
    fprintf('current cell is %d,%d. An error must have occurred. Cell Index was 0. \n',x,y);
end
% resetting the index
Index(2,locind)=0;
% update the grid: simply subtract the cluster from the grid
grid=grid-ismember(shgrid,locind);
% update the shadow grid: simply subtract the cluster*its value from the
% grid.
shgrid=shgrid-ismember(shgrid,locind)*locind;


end