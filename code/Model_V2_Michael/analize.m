function [ F ] = analize( Data )
% The Analize Function takes the Tree Population of every Timesteps and
% searches for decreasing intervals (fires) and sums up all the burned
% trees. Since the Fires are very quick in comparison to the growth rate of
% the trees, one does not need to subtract the trees grown in that
% interval. The Count only starts at the 2000th Timestep to dampen the
% effect of the initial conditions.
F=0;
k=1;
for i=2000:size(Data,2)
    
   
    if Data(i)<Data(i-1)
        F(k)=F(k)-Data(i)+Data(i-1);
    end
    if (Data(i)<Data(i-1) && Data(i-1)>Data(i-2))
        if F(k)>10
        k=k+1;
        end
        F(k)=0;
    end
end

end

