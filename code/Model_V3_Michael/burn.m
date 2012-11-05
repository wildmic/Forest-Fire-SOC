function [ G,n ] = burn( x,y,G )
n=1;
G(x,y)=0;
[a,b,c,d,e,f,g,h]=neighbor(x,y,size(G,1),size(G,2));
if G(a,b)==1
    [G,k]=burn(a,b,G);
    n=n+k;
end
if G(c,d)==1
    [G,k]=burn(c,d,G);
    n=n+k;
end
if G(e,f)==1
    [G,k]=burn(e,f,G);
    n=n+k;
end
if G(g,h)==1
    [G,k]=burn(g,h,G);
    n=n+k;
end
