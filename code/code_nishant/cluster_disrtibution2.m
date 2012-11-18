function Clust2=cluster_disrtibution2(Forest_grid,Nd)
%This code is written for periodic boundary conditions
N=Nd-1;
N2=N-1;
Forest_grid=Forest_grid(2:N,2:N);
%The code with periodic boundary condition works with a grid whose size is
%larger by 2 in each of the dimensions.
Index=3;
%In the following double loop, we mark every site where a green tree is
%there with a new Index if it is a unindexed green tree and the unindexed
%neighbours (which are green trees) of a green tree with the same index as the green tree
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
            if minimum<Inf
                Forest_grid(i,j)=minimum;
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
                Index=Index+1;
            end
         end    
         %Forest_grid
        %pause
        j=j+1;
    end
    i=i+1;
%     Forest_grid
    %pause
end
% Forest_grid
% pause
mistake(Index-3)=0;
noter=1;
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            [v1,v2,v3,v4]=neighbour(i,j,N2);
%             [In,in]=smallest_neighbour(Forest_grid,[i,j],v1,v2,v3,v4);
            m=Forest_grid(i,j);
            m1=converter(Forest_grid(v1(1),v1(2)));
            m2=converter(Forest_grid(v2(1),v2(2)));
            m3=converter(Forest_grid(v3(1),v3(2)));
            m4=converter(Forest_grid(v4(1),v4(2)));
            minimun=min([m,m1,m2,m3,m4]);
            if minimun<Inf
            if minimun==m
                [Forest_grid,mistake,noter]=changer(Forest_grid,m1,m2,m3,m4,minimun,N2,mistake,noter);
            elseif minimun==m1
                [Forest_grid,mistake,noter]=changer(Forest_grid,m,m2,m3,m4,minimun,N2,mistake,noter);
            elseif minimun==m2
                [Forest_grid,mistake,noter]=changer(Forest_grid,m1,m,m3,m4,minimun,N2,mistake,noter);
            elseif minimun==m3
                [Forest_grid,mistake,noter]=changer(Forest_grid,m1,m2,m,m4,minimun,N2,mistake,noter);
            elseif minimun==m4
                [Forest_grid,mistake,noter]=changer(Forest_grid,m1,m2,m3,m,minimun,N2,mistake,noter);
            end
            end
        end
        j=j+1;
    end
    i=i+1
end
% Forest_grid
% pause
NofClust=Index-3;%-(noter-1);
Clust(NofClust)=0;
i=1;
while i<N
    j=1;
    while j<N
        if Forest_grid(i,j)>2
            Clust(Forest_grid(i,j)-2)=Clust(Forest_grid(i,j)-2)+1;
        end
        j=j+1;
    end
    i=i+1;
end
NofClust2=Index-3-(noter-1)
Clust2(NofClust2)=0;
i=1;
j=1;
while i<=NofClust
    if Clust(i)~=0
        Clust2(j)=Clust(i);
        j=j+1;
    end
    i=i+1;
end
% Forest_grid
%Clust
Clust2=Clust2(1:(j-1));
hist(Clust,20)
figure
hist(Clust2)
end
        
