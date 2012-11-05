function [ trees ] = fire( m,n, growth_rate, burn_rate, time  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% This is a 2D-model for a forest fire on variable grid size domains.
% The following four rules are implemented for every grid cell:
% (1) If a grid cell is empty (State 0), it has a growth_rate-chance of
% growing a tree (State 1) every timestep.
% (2) If a grid cell has a burning (State 3) Neighbour, it will catch 
% Fire (State 2)
% (3) If a tree is burning (State 3), it will become an empty site in the
% next timestep (State 0)
% (4) Every timestep, with probability burn_rate, a random tree will ignite
% (State 2)
% The distinction between a burning tree (State 3) and an ignited tree
% (State 2) is needed for a better handling of the updating procedures.

%% Initialization of the grid
% An nxn-Grid with n=grid_size is created
Grid=round(0.9*rand(m,n));
%Grid=ones(m,n);
% It is initialized with about half the grid points having trees on it.
% This is not actually necessary for an SOC-behavior of the model, for it
% should be independant of the boundary conditions.
figure
colormap (summer);
trees=zeros(1,time);
b_trees=zeros(1,time);
%% Time Loop
% looping over all timesteps from 1 to time.
for i=1:time 
    
    i
    %update checks each grid cell for ignited trees which it sets as
    %burning (State 3)
    Grid=update(Grid);
    %ignite checks each grid cell for burning neighbors and sets the grid
    %cells that fulfill the criteria as ignited (State 2)
    Grid=ignite(Grid);
    %growth checks each grid cell for empty space and if, sets it as a tree
    %with probability growth_rate (State 1)
    Grid=grow(Grid,growth_rate);
    %clear searches for burning grid points and sets them back to empty
    %grid cells (State 0)
    Grid=erase(Grid);
    %randign randomly drops a match on a grid cell with a probability
    %burn_rate.
    Grid=randign(Grid, burn_rate);
    [trees(i),b_trees(i)]=diagnostics(Grid);
    %This shows the current grid 
    image(Grid*25); 
    
    %This plot shows the current alive tree population
    %plot(trees)
    %if mod(i,50)==0
        
    getframe;
    %end
    
end

close all;
figure
plot(trees)

end

