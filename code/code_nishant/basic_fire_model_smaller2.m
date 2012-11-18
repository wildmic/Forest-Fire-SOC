function Forest_grid=basic_fire_model_smaller2(N,p,f,Iter)
%Here we implement the forest fire model using the periodic boundary
%condition
% N defines the size of 2-dimensional grid
% Tree will be grown at an empty site if random number generated is less than p 
% A green tree will start burning if either of its neighbours is already burning or a random number generated is less than the lightening parameter f 
%0-tree
%1-empty site
%2-fire
N=N+2; %We create a larger matrix, but we will update only the central portion of the grid
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
trees(Iter-1)=0;
empty(Iter-1)=0;
fires(Iter-1)=0;
while it<Iter
    Forest_grid_temp=Forest_grid;  %Forest_grid_temp is used to create the forest grid at the next time step.
    Forest_grid_temp(1,1)=Forest_grid(N-1,N-1);
    Forest_grid_temp(N,N)=Forest_grid(2,2);
    Forest_grid_temp(N,1)=Forest_grid(2,N-1);
    Forest_grid_temp(1,N)=Forest_grid(N-1,2);
    Forest_grid_temp(1,2:N-1)=Forest_grid(N-1,2:N-1);
    Forest_grid_temp(N,2:N-1)=Forest_grid(2,2:N-1);
    Forest_grid_temp(2:N-1,1)=Forest_grid(2:N-1,N-1);
    Forest_grid_temp(2:N-1,N)=Forest_grid(2:N-1,2);
    
    
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
                if grid(m,n)<p
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
    image(50*(Forest_grid_temp(2:N-1,2:N-1)))
    [tre,emp,fir]=distribution(Forest_grid,N);
    trees(it)=tre;
    empty(it)=emp;
    fires(it)=fir;
    getframe;
    it=it+1;
end
figure
plot(trees)
hold on
plot(empty,'r')
plot(fires,'k')
end