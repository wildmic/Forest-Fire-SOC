function [] =parasweep(G_s,TN,k,t)
fprintf('initializing... \n');
s(k)=0;
% This function simulates a forest fire model on a grid size of G_s and a
% theta ranging from Theta_Null (TN) to Theta_Null*k in k steps. It
% simulates for t timesteps. The growth rate is always set to one.
% 
% 

time=ones(k,1)*t;

s(k)=0;
fac(k)=0;
sf(k)=0;
N(k)=0;

for i=1:k
    tic
    % Output stores the two Vectors s (fire sizes) and N (Number of trees)
    % from the simulation
    % for decreasing simulation lengths, activate the below command:
    fprintf('Simulating %d of %d... ',i,k);
    
    %time(i)=ceil(time(i)/sqrt(i));
    [b,nta]=FFM(G_s,TN*i,1,time(i));
    % s(i) is the mean fire size in the i-th simulation
    s(i)=mean(b)*TN*i;
    % fac(i) is the probability correction factor N/(G-N) of the i-th
    % simulation. 
    % N(i) is the mean number of alive trees in the system for the i-th
    % simulation.
    N(i)=nta;
    fac(i)=N(i)/(G_s^2-N(i));
    % sf(i) is the mean fire size multiplied by the probability factor
    sf(i)=s(i)*fac(i);
  %s(i)=mean(FFM(G_s,TN*i,1,t),1)*TN*i;
    % Progressbar(k,i) is just a neat visualization function for the
    % progress of the meanplotter function. It shows a progress bar! (who
    % would've thought??)
     %progressbar(k,i);
    
    b=0;
    nta=0;
    fprintf('complete \n')
    time_el=toc;
    fprintf('Estimated time left: %g seconds \n',time_el*(k-i))
end

fprintf('creating graphical output...\n')
p=1:k;
% p is the vector which stores the different Theta's
p=p*TN;
%figure
% The First plot shows the weighted mean fire sizes. The graph should be
% more or less constant.
subplot(2,2,1),plot(p,sf,'--rs','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','g')
xlabel('\Theta = f/p')
ylabel('S*\Theta*N/(G-N)')
% The Second Plot shows the unweighted mean fire sizes. The graph should be
% rising.
subplot(2,2,2),plot(p,s,'--rs','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','g')
xlabel('\Theta = f/p')
ylabel(' s_bar \cdot \Theta')
% The Third Graph shows the correction Factor
subplot(2,2,3),plot(p,fac,'--rs','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','g')
xlabel('\Theta = f/p')
ylabel('N/(G-N)')
% The Fourth Graph shows the mean number of trees
subplot(2,2,4),plot(p,N,'--rs','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','g')
xlabel('\Theta = f/p')
ylabel('N');
fprintf('Saving Results... \n')
data=struct('Simulation_Time',t,'Grid_Size',G_s,'Theta_Null',TN, 'Sim_Number',k,'Mean_tree',N,'Theta_vector',p,'Mean_fire_size',s);
cd Results
date_now=datestr(now,1);
time_now=datestr(now,'HH_MM_SS');
if (exist(date_now))~=7
mkdir (date_now );
end
cd (date_now)
save(time_now,'data');
cd ..
cd ..
cd ..
fprintf('Simulation complete. \n')
data


end

