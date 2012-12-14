function [K,Number,Radius]=cluster_disrtibution2_iter(Forest_grid,Index,Nd)
%This code does the right cluster indexing of the grid which has been once
%indexing, but there are some redundencies in it.
%The code with periodic boundary condition works with a grid whose size is
%larger by 2 in each of the dimensions.

%Forest_grid is the grid which we want to analyze.

% Nd is size of the square lattice, but increased by 2. This is because it
%is used with the code "basic_fire_model_smaller2" which generates a
% lattice whose size is 2 larger than the expected size.
N=Nd-1;
N2=N-1;
noter=0; %noter keeps track of the redundancy
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            [v1,v2,v3,v4]=neighbour(i,j,N2); %we calculate all the neighbors
            m=Forest_grid(i,j);
            m1=converter(Forest_grid(v1(1),v1(2)));
            m2=converter(Forest_grid(v2(1),v2(2)));
            m3=converter(Forest_grid(v3(1),v3(2)));
            m4=converter(Forest_grid(v4(1),v4(2)));
            minimun=min([m,m1,m2,m3,m4]);
            %"changer" helps to change replace an index by another index. 
            if minimun<Inf
            if minimun==m
                [Forest_grid,noter]=changer(Forest_grid,m1,...
                m2,m3,m4,minimun,N2,noter);
            elseif minimun==m1
                [Forest_grid,noter]=changer(Forest_grid,m,...
                m2,m3,m4,minimun,N2,noter);
            elseif minimun==m2
                [Forest_grid,noter]=changer(Forest_grid,m1,...
                m,m3,m4,minimun,N2,noter);
            elseif minimun==m3
                [Forest_grid,noter]=changer(Forest_grid,m1,...
                m2,m,m4,minimun,N2,noter);
            elseif minimun==m4
                [Forest_grid,noter]=changer(Forest_grid,m1,...
                m2,m3,m,minimun,N2,noter);
            end
            end
        end
        j=j+1;
    end
    i=i+1;
end
NofClust=Index-3;
%There is a redundency in the total number of indices which can be removed

[row_shift,col_shift]=correct_radius_shift_getter(Forest_grid,Index-1,N2);
%this calculates the correct shift required for evert cluster to find the
%cluster radius appropriately.

%Now, we calculate the radius of different clusters
Clust(NofClust)=0; %It counts the number of trees in all the clusters
FirstMoment(NofClust,2)=0; %First moment generates the mean
SecondMoment(NofClust,2)=0;
%It calsulates the second order moment which can 
%be used to calculate the radius of a cluster.
%The 2nd index in above 2 variables is for 2 directions (x and y)
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            cl=Forest_grid(i,j)-2;
            row=mod(i+row_shift(cl),N2);
            col=mod(j+col_shift(cl),N2);
            Clust(cl)=Clust(cl)+1;
            FirstMoment(cl,1)=FirstMoment(cl,1)+row;
            FirstMoment(cl,2)=FirstMoment(cl,2)+col;
            SecondMoment(cl,1)=SecondMoment(cl,1)+(row*row);
            SecondMoment(cl,2)=SecondMoment(cl,2)+(col*col);
        end
        j=j+1;
    end
    i=i+1;
end
NofClust2=Index-3-noter;            %The actual number of clusters 
Clust2(NofClust2)=0;
%It stores the number of trees in all clusters without any redundancy
Size_clust(NofClust2)=0;  %It stores the radius of all the clusters
i=1;
j=1;
while i<=NofClust
    if Clust(i)~=0
        %Here we are excluding the cluster sizes whose frequency is zero.
        Clust2(j)=Clust(i);
        No=Clust(i);
        Size_clust(j)=(((SecondMoment(i,1)-((FirstMoment(i,1)*...
        FirstMoment(i,1))/No))+(SecondMoment(i,2)-((FirstMoment(i,2)*...
        FirstMoment(i,2))/(No))))/No)^0.5;
        j=j+1;
    end
    i=i+1;
end
Clust2=Clust2(1:(j-1));
[K,Number,Radius]=radius_size_distribution_iter(Clust2,Size_clust,j-1);
end