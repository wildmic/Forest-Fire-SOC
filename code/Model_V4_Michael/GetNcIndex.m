function [ind_a,ind_b,ind_c,ind_d]= GetNcIndex (x,y)

global shgrid;
[a,b,c,d,e,f,g,h]=neighbor(x,y,size(shgrid,1),size(shgrid,2));
ind_a=shgrid(a,b);
ind_b=shgrid(c,d);
ind_c=shgrid(e,f);
ind_d=shgrid(g,h);








end