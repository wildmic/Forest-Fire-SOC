function [ind] = lowIndex()
% The function lowIndex returns the lowest available index.

global Index;

% the find function returns the coordinate of the first non-zero-element of
% a vector or matrix. since we used 1 for unavailable and 0 for available,
% we had to subtract 1 to make 0 unavailable and -1 available. so the first
% time, the find-function hits a value -1, it returns the lowest available
% index.
ind=find(Index(2,:)-1);
% in fact, find returns all the available indexes, so we just take the
% first one (being the lowest since the index matrix is sorted by
% construction)
ind=ind(1);
% Since the function is only called if the index is being used, we set it
% as unavailable.
Index(2,ind)=1;
end