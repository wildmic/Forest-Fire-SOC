function Forest_grid=distributor(Forest_grid,v,v1,N,Index)
%v is the propagator of fire for v1
%v1 is the next cell
%Index is the tag of the cluster
size(Forest_grid)
if Forest_grid(v1(1),v1(2))==0
    Forest_grid(v1(1),v1(2))=Index;
    [v2,v3,v4]=neighbour_known(v1(1),v1(2),N,v);
    Forest_grid=distributor(Forest_grid,v1,v2,N,Index);
    Forest_grid=distributor(Forest_grid,v1,v3,N,Index);
    Forest_grid=distributor(Forest_grid,v1,v4,N,Index);
end
end