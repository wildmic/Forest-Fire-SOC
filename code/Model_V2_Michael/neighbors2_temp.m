function [ output_args ] = neighbors2( j,k,m,n )
%Neighbors2 takes the grid coordinates j,k and the grid dimensions m,n as
%inputs and returns the 2nd Order Moore neighbours as outputs. Boundary
%conditions are assumed to be periodic and well defined. 2nd Order Moore
%coordinates are defined as the Grid points lying in range of 2 or smaller.
%Coordinates are descibed as w (west), n (north), e (east), s(south) and
%double letters for 2 grid points distance respectively.

N=[wwx,wwy,wx,wy,nwx,nwy,nx,ny,nnx,nny,nex,ney,ex,ey,eex,eey,sex,sey,sx,sy,ssx,ssy,swx,swy]
% Standard conditions inside the grid with j (x-coordinate) and k
% (y-coordinate)

%Western coordinates
wx=j-1;
wy=k;
wwx=j-2;
wwy=k;
%North coordinates
nx=j;
ny=k-1;
nnx=j;
nny=k-2;
%Eastern coordinates
ex=j+1;
ey=k;
eex=j+2;
eey=k;
%Southern coordiates
sx=j;
sy=k+1;
ssx=j;
ssy=k+2;
%northwestern coordinates
nwx=j-1;
nwy=k-1;
%northeastern coordinates
nex=j+1;
ney=k-1;
%southeastern coordinates
sex=j+1;
sey=k+1;
%southwestern coordinates
swx=j-1;
swy=k+1;

% Special cases due to periodic boundary conditions
if j==1
    




end

