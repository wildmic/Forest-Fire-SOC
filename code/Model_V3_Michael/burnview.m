function [ G,n,p ] = burnview( x,y,G,reL )
n=1;
G(x,y)=reL/25.1;
image(G*25)
getframe;
pause(0.001)
if reL<5*size(G,1)
ra=ceil(4*rand());
if ra==1
    [a,b,c,d,e,f,g,h]=neighbor(x,y,size(G,1),size(G,2));
end
if ra==2
    [c,d,e,f,g,h,a,b]=neighbor(x,y,size(G,1),size(G,2));

end
if ra==3
    [e,f,g,h,a,b,c,d]=neighbor(x,y,size(G,1),size(G,2));

end
if ra==4 
    [g,h,a,b,c,d,e,f]=neighbor(x,y,size(G,1),size(G,2));
    
end

if G(a,b)==1
    [G,k,reL]=burnview(a,b,G,reL+1);
    n=n+k;
end
if G(c,d)==1
    [G,k,reL]=burnview(c,d,G,reL+1);
    n=n+k;
end
if G(e,f)==1
    [G,k,reL]=burnview(e,f,G,reL+1);
    n=n+k;
end
if G(g,h)==1
    [G,k,reL]=burnview(g,h,G,reL+1);
    n=n+k;
end
end
%G(x,y)=0;
G(x,y)=0;

p=reL-1;

end
