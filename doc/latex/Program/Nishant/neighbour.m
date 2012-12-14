function [v1,v2,v3,v4]=neighbour(i,j,N)
%This function calculates the neighbourhood cells of 
%a cell represented by [i,j] in the periodic
%boubdary condition with the size of the grid as N x N
if i>1 && i<N
    v1=[i-1,j];
    v2=[i+1,j];
    if j>1 && j<N
        v3=[i,j-1];
        v4=[i,j+1];
    elseif j==1
        v3=[i,N];
        v4=[i,j+1];
    elseif j==N
        v3=[i,1];
        v4=[i,j-1];
    end
elseif i==1
    v1=[N,j];
    v2=[i+1,j];    
    if j>1 && j<N
        v3=[i,j-1];
        v4=[i,j+1];
    elseif j==1
        v3=[i,N];
        v4=[i,j+1];
    elseif j==N
        v3=[i,1];
        v4=[i,j-1];
    end
else
    v1=[i-1,j];
    v2=[1,j];    
    if j>1 && j<N
        v3=[i,j-1];
        v4=[i,j+1];
    elseif j==1
        v3=[i,N];
        v4=[i,j+1];
    elseif j==N
        v3=[i,1];
        v4=[i,j-1];
    end
end
end