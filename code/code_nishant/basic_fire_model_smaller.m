function basic_fire_model_smaller(N,p,f)
% N defines the size of 2-dimensional grid
% Tree will be grown at an empty site if random number generated is greater than p 
% A green tree will start burning if either of its neighbours is already burning or a random number generated is less than the lightening parameter f 

%0-tree
%1-empty site
%2-fire
N=N+1; %We create a larger matrix, but we will update only the central portion of the grid
grid=rand(N);
Forest_grid(N,N)=0;
% The following double loop generates the initial forest with either empty
% sites or green trees (generated with equal probability). The probability
% can be varied
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

colormap summer;
it=1;
while it<=100
    Forest_grid_temp=Forest_grid;  %Forest_grid_temp is used to create the forest grid at the next time step.

    grid=rand(N); %At every step, a matrix of random numbers of size N x N is generated. It is used in 2 scenarios: either a green tree (lightening
                  %probability) or an empty site (probability to grow tree)

 % Central N-1 x N-1 grid

 m=2;
    while m<N
        n=2;
        while n<N
            if Forest_grid_temp(m,n)==2
                Forest_grid(m,n)=1;
            elseif Forest_grid_temp(m,n)==1
                if grid(m,n)>p
                    Forest_grid(m,n)=0;
                end
            else
                if (grid(m,n)<f || Forest_grid_temp(m-1,n)==2 || Forest_grid_temp(m+1,n)==2 || Forest_grid_temp(m,n-1)==2 || Forest_grid_temp(m,n+1)==2)
                    Forest_grid(m,n)=2;
                end
            end
            n=n+1;
        end
        m=m+1;
    end
    image(25*Forest_grid_temp(2:N-1,2:N-1))
    pause
    %iter=iter+1;
end
end