function [ G,n,p ] = burnview2( x,y,G,reL,rw,rn,re,rs )
% Burnview 2 is a new implementation of the recursive cluster find
% algorithm. It bases on the principle of "untangeling the path"
n=1;
G(x,y)=reL/25.1;
%image(G*25)
%getframe;
%pause(0.001)
if reL<2*size(G,1)

    [a,b,c,d,e,f,g,h]=neighbor(x,y,size(G,1),size(G,2));


if (G(a,b)==1 && rw<=4*size(G,1))
    [G,k,reL]=burnview2(a,b,G,reL+1,rw+1,rn,re,rs);
    n=n+k;
end
if (G(c,d)==1 && rn<=4*size(G,1))
    [G,k,reL]=burnview2(c,d,G,reL+1,rw,rn+1,re,rs);
    n=n+k;
end
if (G(e,f)==1 && re<=4*size(G,1))
    [G,k,reL]=burnview2(e,f,G,reL+1,rw,rn,re+1,rs);
    n=n+k;
end
if (G(g,h)==1 && rs<=4*size(G,1))
    [G,k,reL]=burnview2(g,h,G,reL+1,rw,rn,re,rs+1);
    n=n+k;
end
end
%G(x,y)=0;
G(x,y)=0;

p=reL-1;

end
