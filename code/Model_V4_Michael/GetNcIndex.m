function [ind_a,ind_b,ind_c,ind_d]= GetNcIndex (x,y)
% The function GetNcIndex takes the local coordinates and returns the
% cluster indices of the neighboring cells

global shgrid;
% call the neighbor function to retrieve the neighboring cell coordinates
% with periodic boundary conditions
[a,b,c,d,e,f,g,h]=neighbor(x,y,size(shgrid,1),size(shgrid,2));
% the neighbor indices are simply the entries of the shadow grid at the
% neighboring coordinates. 
% Note that special cases such as some of the indices being zero is treated
% in the main program.
ind_a=shgrid(a,b);
ind_b=shgrid(c,d);
ind_c=shgrid(e,f);
ind_d=shgrid(g,h);
end