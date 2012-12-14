function [K,Number,Radius,Forest_grid,trees,empty,fires]=...
    basic_fire_model_smaller2_iter(N,p,pbf,Iter,Forest_grid,gridbit)
%Here we implement the forest fire model using the periodic boundary cond.
% N- it defines the size of 2-dimensional grid
% p- Tree will be grown at an empty site if random number generated is less 
%than p 
% pbf is the ratio of p and f where f is defined below
% f- A green tree will start burning if either of its neighbours is already
%burning or a random number generated is less than the lightening parameter f 
%Iter- it defines the number of time steps we want to evolve the system.
%If gridbit is 1, the inital grid will be the one given as Forest_grid,
%otherwise it is generated with 50-50 prob to grow a tree or to have empty
%site

%0-tree
%1-empty site
%2-fire

%This code is specifically written to calculate various distributions at
%every step and then average over all of them.
%This is important since in the SOC state, the distributions change in every step. 

%It_steps store is a vector which stores the correct time for measuring the
%various distributions (associated index is "me")
It_steps=linspace(201,Iter,Iter-200);
f=p/pbf;
N2=N;
N=N+2; 
%We create a larger matrix, but we will update only the central portion of the grid
grid=rand(N);
Forest_grid(N,N)=0;

% The following double loop generates the initial forest with either empty 
%sites or green trees (generated with equal probability). The probability
% can be varied

if gridbit~=1
pause
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
K=0;
Number=0;
Radius=0;
it=1;
me=1;
Index_grid(N-2,N-2)=0;
trees(Iter-1)=0; %it stores the fraction of trees for all the time steps 
empty(Iter-1)=0; %it stores the fraction of empty sites for every time steps
fires(Iter-1)=0; %it stores the fraction of fires for all the time steps
while it<Iter
    tic
    Forest_grid_temp=Forest_grid;  
    %Forest_grid_temp is used to create the forest grid at next time step.
    Forest_grid_temp(1,2:N-1)=Forest_grid(N-1,2:N-1);
    Forest_grid_temp(N,2:N-1)=Forest_grid(2,2:N-1);
    Forest_grid_temp(2:N-1,1)=Forest_grid(2:N-1,N-1);
    Forest_grid_temp(2:N-1,N)=Forest_grid(2:N-1,2);
        
    grid=rand(N); 
    %At every step, a matrix of random numbers of size N x N is generated.
    %It is used in 2 scenarios: either a green tree (lightening
    %probability) or an empty site (probability to grow tree)

    if It_steps(me)==it%measuring various distributions
        Index=3;
        Index_grid(:,:)=0;
    end
    tre=0;      %counting trees at a time step
    emp=0;      %counting empty sites at a time step
    fir=0;      %counting fires at a time
    i=2;
    while i<N
        j=2;
        while j<N
%             we update cells depending on their previous state
            if Forest_grid_temp(i,j)==2
                fir=fir+1;
                Forest_grid(i,j)=1;            
            elseif Forest_grid_temp(i,j)==1
                emp=emp+1;
                if grid(i,j)<p
                    Forest_grid(i,j)=0;
                end
            else
                tre=tre+1;
                if (grid(i,j)<f || Forest_grid_temp(i-1,j)==2 || ...
                        Forest_grid_temp(i+1,j)==2 ||... 
                   Forest_grid_temp(i,j-1)==2 || Forest_grid_temp(i,j+1)==2)
               
                    Forest_grid(i,j)=2;
               
                end
                if It_steps(me)==it
                    i1=i-1;
                    j1=j-1;
                    if Forest_grid_temp(i,j)==0 || Index_grid(i1,j1)>2
                        [v1,v2,v3,v4]=neighbour(i1,j1,N2);
                        m=converter(Forest_grid_temp(i1,j1));
                        m1=converter(Forest_grid_temp(v1(1),v1(2)));
                        m2=converter(Forest_grid_temp(v2(1),v2(2)));
                        m3=converter(Forest_grid_temp(v3(1),v3(2)));
                        m4=converter(Forest_grid_temp(v4(1),v4(2)));
                        minimum=min([m,m1,m2,m3,m4]);
                        %All the cells which are not green or unindexed 
                        %becomes infinity due to converter function            
                        if minimum<Inf
                            %We are handeling the case when atleast one of
                            %the neighbours has an index already.
                            Index_grid(i1,j1)=minimum; 
                            %The current cell is awarded this minimum index                
                            % In the fillowing 4 if statements, the minimum
                            %index is given to cell which has a green tree.                
                            if Forest_grid_temp(v1(1),v1(2))==0 || ...
                                    Index_grid(v1(1),v1(2))>minimum
                                
                                Index_grid(v1(1),v1(2))=minimum;
                            end
                            if Forest_grid_temp(v2(1),v2(2))==0 || ...
                                    Index_grid(v2(1),v2(2))>minimum
                                
                                Index_grid(v2(1),v2(2))=minimum;
                            end
                            if Forest_grid_temp(v3(1),v3(2))==0 || ...
                                    Index_grid(v3(1),v3(2))>minimum
                                
                                Index_grid(v3(1),v3(2))=minimum;
                            end
                            if Forest_grid_temp(v4(1),v4(2))==0 || ...
                                    Index_grid(v4(1),v4(2))>minimum
                                
                                Index_grid(v4(1),v4(2))=minimum;
                            end            
                        else
                            Index_grid(i1,j1)=Index;
                            % In the fillowing 4 if statements,the index 
                            %is given to each cell which has green tree.
                           if Forest_grid_temp(v1(1),v1(2))==0
                                Index_grid(v1(1),v1(2))=Index;
                           end
                            if Forest_grid_temp(v2(1),v2(2))==0
                                Index_grid(v2(1),v2(2))=Index;
                            end
                            if Forest_grid_temp(v3(1),v3(2))==0
                                Index_grid(v3(1),v3(2))=Index;
                            end
                            if Forest_grid_temp(v4(1),v4(2))==0
                                Index_grid(v4(1),v4(2))=Index;
                            end
                            %Index tells about the total number of 
                            %different indices used
                            Index=Index+1;
                        end
                    end
                end
            end
            j=j+1;
        end
        i=i+1;
    end
    if It_steps(me)==it
        [K1,Number1,Radius1]=cluster_disrtibution2_iter(Index_grid,Index,N);
%         K1
        if K<K1
            K=K1;
            Number(K)=0;
            Radius(K)=0;
        else
            Number1(K)=0;
            Radius1(K)=0;
        end
        Number=Number+Number1;
        Radius=Radius+Radius1;
        me=me+1;
    end
    trees(it)=tre;
    empty(it)=emp;
    fires(it)=fir;
    it=it+1
    toc
end
    figure
    plot(trees/(N*N))
    hold on
    plot(empty/(N*N),'r')
    plot(fires/(N*N),'k')
    hleg1 = legend('Trees','Empty sites','Fires');
    set(hleg1,'Location','NorthEast')
    hold off
s=1:K;
figure
plot(log10(s),log10(Radius./Number))
figure
plot(log10(s),log10(Number/(Number(1))))
end