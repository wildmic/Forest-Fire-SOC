function [ a,b,c,d,e,f,g,h] = neighbors32( j,k )
if (j==1 && k==1)
    a=32;
    b=1;
    c=1;
    d=32;
    e=2;
    f=1;
    g=1;
    h=2;
end
if (j==1 && k~=1 && k~=32)
    a=32;
    b=k;
    c=j;
    d=k-1;
    e=j+1;
    f=k;
    g=j;
    h=k+1;
end
if (j==1 && k==32)
    a=32;
    b=k;
    c=1;
    d=31;
    e=2;
    f=32;
    g=1;
    h=1;
end
if (j~=1 && j~=32 && k==32)
    a=j-1;
    b=32;
    c=j;
    d=k-1;
    e=j+1;
    f=k;
    g=j;
    h=1;
end
if (j==32 && k==32)
    a=j-1;
    b=k;
    c=j;
    d=k-1;
    e=1;
    f=k;
    g=j;
    h=1;
end
if (j==32 && k~=1 && k~=32)
    a=j-1;
    b=k;
    c=j;
    d=k-1;
    e=1;
    f=k;
    g=j;
    h=k+1;
end
if (j==32 && k==1)
    a=j-1;
    b=k;
    c=j;
    d=32;
    e=1;
    f=k;
    g=j;
    h=k+1;
end
if (j~=1 && j~=32 && k==1)
    a=j-1;
    b=k;
    c=j;
    d=32;
    e=j+1;
    f=k;
    g=j;
    h=k+1;
end
if (j~=1 && j~=32 && k~=1 && k~=32)
    a=j-1;
    b=k;
    c=j;
    d=k-1;
    e=j+1;
    f=k;
    g=j;
    h=k+1;
end
end
    