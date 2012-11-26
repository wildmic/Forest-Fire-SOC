function [Forest_grid]=enforcer(Forest_grid,In_small,In_large,N)
%It replaces all the cells with index In_large with the index In_small
%This is the inefficient guy!!!!
%It takes an index (In_large) and replaces all the cells with that index by
%a smaller index (In_small) 
i=1;
    while i<=N
        j=1;
        while j<=N
            if Forest_grid(i,j)==In_large
                Forest_grid(i,j)=In_small;
            end
            j=j+1;
        end
        i=i+1;
    end
% end
end