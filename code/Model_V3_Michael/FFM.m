function [ F,Nt_mean ] = FFM( G_Size,f,p,t )
%This FFM bases on the assumption that the process of a forest fire is
%instantaneous in comparison to the time it takes to regrow the trees
%(which actually is quite realistic). It also does not loop over all cells
%to update the grid. Instead, every timestep, a single, random cell is
%choosen. If the cell is empty, then with probability p, a tree will be
%planted there. If the cell already has a tree, then with probability f, it
%will be burned. This will call the burn-function, which resets the grid
%point to zero and calls the burn function for every tree neighbor. It is
%therefore recursive and instantaneously sets every connected tree back to
%zero. It also returns the number of burned trees in all sub-executions of
%itself, so that the return value of the initial burn function is the total
%number of burned trees in the process. 
%If for any timestep, this number is different from zero, then a fire has
%occurred. The incidents are stored in the variable F.
%The grid has periodic boundary conditions and is initialized empty, which
%usually results in a lot of small fires in the beginning.
%If the grid is very large, then due to the nature of the implementation, a
%larger number of timesteps is needed to fill the grid to a certain amount
%than with a smaller grid.
%G=ceil(rand(G_Size)-0.5);
G=ones(G_Size);
colormap summer;
% F is the fire size counter
F(t)=0;
r=1;

%Nt is the total number of trees present in the system
Nt(t)=0;
%Nt_b is the mean number of trees present in the system averaged over all
%timesteps
Nt_mean=0;

for i=1:t
    Nt(i)=sum(sum(G));
    n=0;
    reL=0;
    
    
    %Pick a random grid cell
    x=ceil(G_Size*(rand(1)));
    y=ceil(G_Size*(rand(1)));
    %if the grid cell is empty
    if G(x,y)==0
        k=rand();
        %With some probability p, grow a tree.
        if k<p
            G(x,y)=1;
        end
    else 
        %if there is a tree, with some probability, burn it.
        k=rand();
        if k<f
            G(x,y)=2;
            %[G,n,reL]=burnview(x,y,G,reL);
            [G,n,reL]=burnview2(x,y,G,reL,0,0,0,0);
        end
    end
    %Since the burning process is instantaneous in comparison to the growth
    %we can search for every connected cell and burn it. This is
    %implemented in a recursive function.
    %image(G*25)
    %getframe;
    if n>0
        
        F(r)=n;
        
        r=r+1;
        
    end
    
end
F=F(1:r-1);
Nt_mean=max(Nt);

end

