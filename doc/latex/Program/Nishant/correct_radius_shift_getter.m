function [row_shift,col_shift]=correct_radius_shift_getter(Forest_grid,K,N)
%Cluster number goes from 3 to K
%In order to find the right column shift, we scan through all the rows for
%a given column and in the external loop we change the columns.
%The value of variable F decides the structure of a cluster: whether it is 
%making use of the periodic boundary or not.

%Initially, for every cluster, F is 0. If the first element of a cluster is
%not there in the first column, then this cluster cant be using the
%periodic boundary. We make F for this cluster to be 3.

%In case, it is the first row, we make F=1, because now we don't know 
%whether it makes use of the bounadry or not. We also record the latest
%entry of a cluster in ml.

%If we find that F=1 for a cluster, we compare the current column with the 
%last column where an element of this cluster is found. In case, it is the
%previous cluster, we go on by updating the ml. 

%On the other hand, if the last column where an element of cluster was 
%found is not the previous column, we know that this cluster uses boundary
%conditions. In this case,we store this entry in mr and make value of F 
%for this cluster=2. 

%We know now that we need to do the shift only if F=2 for a cluster and 
%amount of shift is N+1-mr

F(K-2)=0;           
%For a given cluster, if F is 0; no element of this cluster is yet found.
%if F=1, begining has been found, but we don't know whether it uses 
%periodic boundary or not.
%if F=2, the cluster uses periodic boundary condition
%if F=3, the first element of the cluster is not in the first row and 
%hence it does not use the periodic boundary

ml(K-2)=0;
%In case F=1 for a cluster, it stores the latest column where 
%an element of a cluster was found

mr(K-2)=0;
%In case F=2 for a cluster, it stores the starting column where an 
%element of a cluster was found near the right boundary

col_shift(K-2)=0;
%it stores the shift needed for a column
j=1;
while j<=N
    i=1;
    while i<=N
        cl=Forest_grid(i,j);
        if cl>2
            cl=cl-2;
            if F(cl)==0
                if j~=1
                    F(cl)=3;
                else
                    F(cl)=1;
                    ml(cl)=j;
                end
            elseif F(cl)==1
                if j~=ml(cl)+1
                    mr(cl)=j;
                    F(cl)=2;
                    col_shift(cl)=N+1-mr(cl);
                else
                    ml(cl)=j;
                end
            end
        end
        i=i+1;
    end
    j=j+1;
end
F(:)=0;

ml(:)=0;
%In case F=1 for a cluster, it stores the latest row where an element 
%of a cluster was found

mr(:)=0;
%In case F=2 for a cluster, it stores the starting row where an 
%element of a cluster was found near the lower boundary

row_shift(K-2)=0;
%it stores the shift needed for a row
i=1;
while i<=N
    j=1;
    while j<=N
        cl=Forest_grid(i,j);
        if cl>2
            cl=cl-2;
            if F(cl)==0
                if i~=1
                    F(cl)=3;
                else
                    F(cl)=1;
                    ml(cl)=i;
                end
            elseif F(cl)==1
                if i~=ml(cl)+1
                    mr(cl)=i;
                    F(cl)=2;
                    row_shift(cl)=N+1-mr(cl);
                else
                    ml(cl)=i;
                end
            end
        end
        j=j+1;
    end
    i=i+1;
end
end