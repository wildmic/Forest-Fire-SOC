function [s,Clust2,Number,Radius]=cluster_disrtibution2(Forest_grid,Nd)
%This code is written for periodic boundary conditions
%The code with periodic boundary condition works with a grid whose size is
%larger by 2 in each of the dimensions.
% nd is size of the square lattice, but increased by 2. This is because it
% is used with the code "basic_fire_model_smaller2" which generates a
% lattice whose size is 2 larger than the expected size.
N=Nd-1;
N2=N-1;
Forest_grid=Forest_grid(2:N,2:N); %We extract the exact size of the Forest-grid
Index=3;
%In the following double loop, we mark every site where a green tree is
%there with a new Index if it is a unindexed green tree and the unindexed
%neighbours (which are green trees) of a green tree with the same index as
%the green tree or the minimum index among this tree and its neighbours
i=1;
while i<N
    j=1;
    while j<N
         if Forest_grid(i,j)==0 || Forest_grid(i,j)>2    
            [v1,v2,v3,v4]=neighbour(i,j,N2);                     %we caclulate the indices of all the neighbours of a cell
            m=converter(Forest_grid(i,j));
            m1=converter(Forest_grid(v1(1),v1(2)));
            m2=converter(Forest_grid(v2(1),v2(2)));
            m3=converter(Forest_grid(v3(1),v3(2)));
            m4=converter(Forest_grid(v4(1),v4(2)));
            minimum=min([m,m1,m2,m3,m4]);
            %All the cells which are not green or unindexed becomes
            %infinity due to converter function
            if minimum<Inf
                %We are handeling the case when atleast one of the
                %neighbours has an index already.
                Forest_grid(i,j)=minimum; %The current cell is awarded this minimum index
                % In the fillowing 4 if statements, the minimum index is
                % given to each of the cells which have a green tree.
                if Forest_grid(v1(1),v1(2))==0 || Forest_grid(v1(1),v1(2))>2
                    Forest_grid(v1(1),v1(2))=minimum;
                end
                if Forest_grid(v2(1),v2(2))==0 || Forest_grid(v2(1),v2(2))>2
                    Forest_grid(v2(1),v2(2))=minimum;
                end
                if Forest_grid(v3(1),v3(2))==0 || Forest_grid(v3(1),v3(2))>2
                    Forest_grid(v3(1),v3(2))=minimum;
                end
                if Forest_grid(v4(1),v4(2))==0 || Forest_grid(v4(1),v4(2))>2
                    Forest_grid(v4(1),v4(2))=minimum;
                end
            
            else
                Forest_grid(i,j)=Index;
                % In the fillowing 4 if statements, the index is
                % given to each of the cells which have a green tree.
                if Forest_grid(v1(1),v1(2))==0
                    Forest_grid(v1(1),v1(2))=Index;
                end
                if Forest_grid(v2(1),v2(2))==0
                    Forest_grid(v2(1),v2(2))=Index;
                end
                if Forest_grid(v3(1),v3(2))==0
                    Forest_grid(v3(1),v3(2))=Index;
                end
                if Forest_grid(v4(1),v4(2))==0
                    Forest_grid(v4(1),v4(2))=Index;
                end
                %Index tells about the total number of different indices
                %used
                Index=Index+1;
            end
         end    
        j=j+1;
    end
    i=i+1;
end
mistake(Index-3)=0;
%The above code is not fullproof, since it flawed because of the periodic
%boundary condition and method of indexing goes in 1 direction along the
%grid and it does not cover all the nearest neighbours in the periodic
%boundary conditions
noter=0;
%noter keeps track of the redundancy
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            [v1,v2,v3,v4]=neighbour(i,j,N2);            %we calculate all the neighbors
            m=Forest_grid(i,j);
            m1=converter(Forest_grid(v1(1),v1(2)));
            m2=converter(Forest_grid(v2(1),v2(2)));
            m3=converter(Forest_grid(v3(1),v3(2)));
            m4=converter(Forest_grid(v4(1),v4(2)));
            minimun=min([m,m1,m2,m3,m4]);
            %"changer" helps to change replace an index by another index. 
            if minimun<Inf
            if minimun==m
                [Forest_grid,noter]=changer(Forest_grid,m1,m2,m3,m4,minimun,N2,noter);
            elseif minimun==m1
                [Forest_grid,noter]=changer(Forest_grid,m,m2,m3,m4,minimun,N2,noter);
            elseif minimun==m2
                [Forest_grid,noter]=changer(Forest_grid,m1,m,m3,m4,minimun,N2,noter);
            elseif minimun==m3
                [Forest_grid,noter]=changer(Forest_grid,m1,m2,m,m4,minimun,N2,noter);
            elseif minimun==m4
                [Forest_grid,noter]=changer(Forest_grid,m1,m2,m3,m,minimun,N2,noter);
            end
            end
        end
        j=j+1;
    end
    i=i+1
end
NofClust=Index-3;
%There is a redundency in the total number of indices which can be removed
%Now, we calculate the radius of different clusters
Clust(NofClust)=0;                       %It counts the number of trees in all the clusters
FirstMoment(NofClust,2)=0;              %First moment generates the mean
SecondMoment(NofClust,2)=0;             %It calsulates the second order moment which can be used to calculate the radius of a cluster.
%The 2nd index in above 2 variables is for 2 directions (x and y)
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            Clust(Forest_grid(i,j)-2)=Clust(Forest_grid(i,j)-2)+1;
            FirstMoment(Forest_grid(i,j)-2,1)=FirstMoment(Forest_grid(i,j)-2,1)+i;
            FirstMoment(Forest_grid(i,j)-2,2)=FirstMoment(Forest_grid(i,j)-2,2)+j;
            SecondMoment(Forest_grid(i,j)-2,1)=SecondMoment(Forest_grid(i,j)-2,1)+(i*i);
            SecondMoment(Forest_grid(i,j)-2,2)=SecondMoment(Forest_grid(i,j)-2,2)+(j*j);
        end
        j=j+1;
    end
    i=i+1;
end

NofClust2=Index-3-noter;            %The actual number of clusters 
Clust2(NofClust2)=0;                %It stores the number of trees in all the clusters without any redundancy
Size_clust(NofClust2)=0;            %It stores the radius of all the clusters
i=1;
j=1;
while i<=NofClust
    if Clust(i)~=0                  %Here we are excluding the zero size clusters
        Clust2(j)=Clust(i);
        No=Clust(i);
        Size_clust(j)=(((SecondMoment(i,1)-((FirstMoment(i,1)*FirstMoment(i,1))/No))+(SecondMoment(i,2)-((FirstMoment(i,2)*FirstMoment(i,2))/(No))))/No)^0.5;
        j=j+1;
    end
    i=i+1;
end
% Forest_grid
%Clust
%j-1==Nofclust2
Clust2=Clust2(1:(j-1));
hist(Clust,20)
figure
hist(Clust2)
[s,Number,Radius]=radius_size_distribution(Clust2,Size_clust,j-1);

end