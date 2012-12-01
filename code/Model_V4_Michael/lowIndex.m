function [ind] = lowIndex()
%ind=1;
%check=1;
global Index;
%while check==1
 %   if Index(2,ind)==0
  %      check=0;
   % end
   % ind=ind+1;
%end
%ind=ind-1;
% Set the availability as 1

ind=find(Index(2,:)-1);
ind=ind(1);
Index(2,ind)=1;
end