function [] = clusterburn(x,y)
global Index
global grid
global shgrid
locind=shgrid(x,y);
if locind==0
    fprintf('current cell is %d,%d. An error must have occurred. Cell Index was 0. \n',x,y);
end
% resetting the index
Index(2,locind)=0;

grid=grid-ismember(shgrid,locind);
shgrid=shgrid-ismember(shgrid,locind)*locind;


end