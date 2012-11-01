function [a,b,c,d,e,f,g,h] = neighbor(j,k,m,n)
% This sub-function returns the 1st order moore neighbourhood for a grid
% cell [j,k] on a mxn grid with periodic bc. [a,b]: West; [c,d]: North;
% [e,f]: East; [g,h]: South;
a=j-1;
b=k;
c=j;
d=k-1;
e=j+1;
f=k;
g=j;
h=k+1;
if j==1
    a=m;
end
if j==m
    e=1;
end
if k==1
    d=n;
end
if k==n
    h=1;
end