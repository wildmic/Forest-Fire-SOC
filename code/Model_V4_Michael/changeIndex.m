function [] = changeIndex(from, to)
global Index;
global shgrid;
% check if the change is not senseless
if (from~=to)
    % make Index available
   Index(2,from)=0;
   % update shadow grid
   shgrid=shgrid-ismember(shgrid,from)*(from-to);
   
end

    