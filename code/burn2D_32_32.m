function [ output_args ] = burn2D( rate, t, period )

% 2D Model of a 32x32 Forest Grid
% For SOC study of Forest Fires
% Rate is the growth rate of trees, variing between 0 and 1 (usually ca.
% 0.1)
% t is the amount of burning incidents
% period is the time between two burning incidents

% Create Grid
A=zeros(32);


NTrees=zeros(t*period);
Burn=zeros(t);
burn_number=0;






figure
colormap summer;
for i=1:1:t*period % moving over all Time-Steps
   if mod(i,period)==0 % every Period-th time step, a random grid point is set on fire
       x=round(32*rand(1,1))+1;
       if x>32
           x=32;
       end
       
       y=round(32*rand(1,1))+1;
       if y>32
           y=32;
       end
       A(x,y)=2;
       burn_number=burn_number+1; % track different burning events by burn_number
       Burn(burn_number)=1; % track # trees burned in a specific Fire
   end
   % check # trees in system and add # burning trees to Burn
    for j=1:32
           for k=1:32
               if A(j,k)==1
                   NTrees(i)=NTrees(i)+1;
               end
              
           end
       end
   
   
    for j=1:32  % moving over all x 
        for k=1:32  % moving over all y
            [a,b,c,d,e,f,g,h]=neighbors32(j,k); % creating neighboring matrix indices with PBC's
            if A(j,k)==1 % if there is a tree present on grid point j,k
                 if (A(a,b)==3 || A(c,d)==3 || A(e,f)==3 || A(g,h)==3 ) % if a neighbor is burning and not newly burning (to suppress fragments)
                    A(j,k)=2;  % set it as burning 
                    Burn(burn_number)=Burn(burn_number)+1;
                 end
            end
           
        end
    end
    for j=1:32
        for k=1:32
            if A(j,k)==0 % if grid point is empty
                x=rand(1);
                if x<rate
                    A(j,k)=1; % grow tree with some probability "rate"
                end
            end
            if A(j,k)==3  % if grid point is burning
                
                A(j,k)=0; % reset it
            elseif A(j,k)==2 % if grid point is ignited
                A(j,k)=3; % set it to burning
            end
        end
    end
 image(A*25);
 M(i)=getframe;
 
end

%fps=period;
%movie(M)

hold off;
plot(NTrees)
xlabel=('time steps');
ylabel=('alive trees');

colormap bone;
hist(Burn,100);
set(gca,'YScale','log');
set(gca,'XScale','log');

end
            
            
            
            
            
            
            
            
