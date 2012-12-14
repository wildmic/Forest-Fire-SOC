function [s,Number,Radius]=...
    radius_size_distribution(cluster,size_clust,Nofclusters)
%This function gives number of clusters and radius of clusters as a 
%function of cluster-size (where cluster size means the number of trees in
%the cluster 

%cluster stores the number of tree in each of the clusters
%size_clust stores the radius of various clusters
%Nofclusters is the total number of clusters
K=max(cluster);
Number(K)=0;  %it stores the number of clusters of different number of trees
Radius(K)=0;  
i=1;
while i<=Nofclusters
    Number(cluster(i))=Number(cluster(i))+1;
    Radius(cluster(i))=Radius(cluster(i))+size_clust(i); 
    %we will take average of the radius in case there are more 
    %than 1 cluster having a given number of trees
    i=i+1;
end
Number1(K)=0;
Radius1(K)=0;
s(K)=0;
i=1;
j=1;
while i<=K
    if Number(i)~=0
        s(j)=i;
        Number1(j)=Number(i);
        Radius1(j)=Radius(i)./Number(i);                       
        %we are doing the averaging excluding the cases where we have 
        %no clusters or 1 cluster of a given size
        j=j+1;                                                        
    end
    i=i+1;
end
j=j-1;
s=s(1:j);
Number=Number1(1:j);
Radius=Radius1(1:j);
end