function [IndexedGrid] = CFinder(Grid)
% This function takes a grid with two inherent states (0 being an empty
% site and 1 being an active site). It then searches for connected tree
% clusters. It returns several data sets regarding the cluster size
% distribution, the cluster radius distribution and so on.
CIndex=2;
count=1;
i=0;
for j=1:size(Grid,1)
    for k=1:size(Grid,2)
        if Grid(j,k)==1
            Grid(j,k)=CIndex;
            CIndex=CIndex+1;
        end
    end
end
   
    
        for ind=2:CIndex-1
    co=1;
            while (co~=0)
                co=0;
                for j=1:size(Grid,1)
                    for k=1:size(Grid,2)
                        if Grid(j,k)==ind
                            [a,b,c,d,e,f,g,h]=neighbor(j,k,size(Grid,1),size(Grid,2));
                            if (Grid(a,b)~=ind && Grid(a,b)~=0)
                                Grid(a,b)=ind;
                                co=co+1;
                            end
                            if (Grid(c,d)~=ind && Grid(c,d)~=0)
                                Grid(c,d)=ind;
                                co=co+1;
                            end
                            if (Grid(e,f)~=ind && Grid(e,f)~=0)
                                Grid(e,f)=ind;
                                co=co+1;
                            end
                            if (Grid(g,h)~=ind && Grid(g,h)~=0)
                                Grid(g,h)=ind;
                                co=co+1;
                            end
                        end
                    end
                end
            end
        end
            ClusterIndex=1;            
for ind=2:CIndex-1
    counter=0;
   for j=1:size(Grid,1)
       for k=1:size(Grid,2)
           if Grid(j,k)==ind
            Grid(j,k)=ClusterIndex;
            counter=counter+1;
           end
       end
   end
   if counter>0
       ClusterIndex=ClusterIndex+1;
   end
end
    
    

                
           
    IndexedGrid=Grid;
end