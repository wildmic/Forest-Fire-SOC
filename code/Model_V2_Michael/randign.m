function [ Grid ] = randign( Grid, burn_rate )
%UNTITLED7 Summary of this function goes here
%   randign randomly drops a match on a grid point with probability
%   burn_rate.
x=rand(1,1);
if x<burn_rate
    cordx=floor(size(Grid,1)*rand(1,1)+1);
    cordy=floor(size(Grid,2)*rand(1,1)+1);
    Grid(cordx,cordy)=3;
end


end

