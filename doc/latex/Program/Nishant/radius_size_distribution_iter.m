function [K,Number,Radius]=...
    radius_size_distribution_iter(cluster,size_clust,Nofclusters)
%This function gives number of clusters and radius of clusters as a 
%function of cluster-size (where cluster size means the number of trees in
%the cluster)

%cluster stores the number of tree in each of the clusters
%size_clust stores the radius of various clusters
%Nofclusters is the total number of clusters
K=max(cluster);
Number(K)=0;%it stores the number of clusters of different number of trees
Radius(K)=0;
i=1;
while i<=Nofclusters
    Number(cluster(i))=Number(cluster(i))+1;
    Radius(cluster(i))=Radius(cluster(i))+size_clust(i);
    %If we have more than 1 cluster of a given size, we just add all such
    %radii and in the end, we will divide with it by the total number of
    %clusters of that size
    i=i+1;
end
end