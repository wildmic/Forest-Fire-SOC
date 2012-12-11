function [] = changeIndex(from, to)
% the changeIndex function changes all cell indices "from" on the
% shadowgrid to "to".
global Index;
global shgrid;
% check if the change is not senseless
if (from~=to)
   % make Index available again
   Index(2,from)=0;
   % update shadow grid
   % the ismember-function returns a matrix the same size as shgrid with
   % everything being zero except the entries where cells had the value
   % "from" (value=1). Multiplied by the difference from-to, we can
   % subtract it from the original grid and therefore change all the values
   % "from" to "to".
   shgrid=shgrid-ismember(shgrid,from)*(from-to);
   
end

    