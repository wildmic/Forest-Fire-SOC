function [Forest_grid,trees,empty,fires]=...
    basic_fire_model_smaller2(N,p,pbf,Iter,plotbit,Forest_grid,gridbit)
%Here we implement the forest fire model using the periodic boundary 
%condition

% N- it defines the size of 2-dimensional grid

% p- Tree will be grown at an empty site if random number generated is 
%less than p 
% pbf is the ratio of p and f where f is defined below

% f- A green tree will start burning if either of its neighbours is already
%burning or a random number generated is less than the lightening parameter 
%f 

%Iter- it defines the number of time steps we want to evolve the system.
%If plotbit is 1, fires, trees and empty sites will be plotted as a 
%function of iterations, otherwise not

%If gridbit is 1, the inital grid will be the one given as Forest_grid,
%otherwise it is generated with 50-50 prob to grow a tree or to have empty
%site

%0-tree
%1-empty site
%2-fire

f=p/pbf;
N=N+2; %We create a larger matrix, but we will update only the central 
%portion of the grid
grid=rand(N);
Forest_grid(N,N)=0;

% The following double loop generates the initial forest with either empty
%sites or green trees (generated with equal probability). The probability
% can be varied

if gridbit~=1
m=2;
while m<N
    n=2;
    while n<N
        if grid(m,n)<0.5
            Forest_grid(m,n)=0;
        else
            Forest_grid(m,n)=1;
        end
        n=n+1;
    end
    m=m+1;
end
end

% colormap summer;
it=1;
trees(Iter-1)=0;   %it stores the fraction of trees for all the time steps 
empty(Iter-1)=0;   %it stores the fract of empty sites for every time step
fires(Iter-1)=0;   %it stores the fraction of fires for all the time steps
burntcounter=0;
lightcounter=0;
while it<Iter
    Forest_grid_temp=Forest_grid;  
    %Forest_grid_temp is used to create forest grid at the next time step.
    % we need to take care that the neighbors of every cell are correct 
    %as based on the periodic boundary condition. 
    Forest_grid_temp(1,2:N-1)=Forest_grid(N-1,2:N-1);
    Forest_grid_temp(N,2:N-1)=Forest_grid(2,2:N-1);
    Forest_grid_temp(2:N-1,1)=Forest_grid(2:N-1,N-1);
    Forest_grid_temp(2:N-1,N)=Forest_grid(2:N-1,2);
    
    
    grid=rand(N); 
    %At every step, a matrix of random numbers of size N x N is generated. 
    %It is used in 2 scenarios: either a green tree (lightening
    %probability) or an empty site (probability to grow tree)

    % Central N-1 x N-1 grid

    tre=0;      %counting trees at a times
    emp=0;      %counting empty sites at a times
    fir=0;      %counting fires at a time
    m=2;
    while m<N
        n=2;
        while n<N
%             we update cells depending on their previous state
            if Forest_grid_temp(m,n)==2
                fir=fir+1;
                Forest_grid(m,n)=1;
                
                 
            elseif Forest_grid_temp(m,n)==1
                emp=emp+1;
                if grid(m,n)<p
                    Forest_grid(m,n)=0;
                end
            else
                tre=tre+1;
                if (grid(m,n)<f || Forest_grid_temp(m-1,n)==2 || ...
                        Forest_grid_temp(m+1,n)==2 ||...
                        Forest_grid_temp(m,n-1)==2 ||...
                        Forest_grid_temp(m,n+1)==2)
                    Forest_grid(m,n)=2;
                end
            end
            n=n+1;
        end
        m=m+1;
    end
%   image(25*(Forest_grid_temp(2:N-1,2:N-1)))
    trees(it)=tre;
    empty(it)=emp;
    fires(it)=fir;
%    getframe;
    it=it+1
end
if plotbit==1
    figure
    plot(trees/(N*N))
    hold on
    plot(empty/(N*N),'r')
    plot(fires/(N*N),'k')
    hleg1 = legend('Trees','Empty sites','Fires');
    set(hleg1,'Location','NorthEast')
    hold off
else
    trees=(trees(it-1))/(N*N);
    fires=(fires(it-1))/(N*N);
    empty=(empty(it-1))/(N*N);
end
end