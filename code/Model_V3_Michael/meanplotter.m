function [] =meanplotter(G_s,TN,k,t)
s(k)=0;
% This function simulates a forest fire model on a grid size of G_s and a
% theta ranging from Theta_Null (TN) to Theta_Null*k in k steps. It
% simulates for t timesteps. The growth rate is always set to one.
% 
% 

s(k)=0;
fac(k)=0;
sf(k)=0;
N(k)=0;
for i=1:k
    % Output stores the two Vectors s (fire sizes) and N (Number of trees)
    % from the simulation
    Output=FFM(G_s,TN*i,1,t);
    % s(i) is the mean fire size in the i-th simulation
    s(i)=mean(Output(1))*TN*i;
    % fac(i) is the probability correction factor N/(G-N) of the i-th
    % simulation. 
    % N(i) is the mean number of alive trees in the system for the i-th
    % simulation.
    N(i)=Output(2);
    fac(i)=N(i)/(G_s^2-N(i));
    % sf(i) is the mean fire size multiplied by the probability factor
    sf(i)=s(i)*fac(i);
  %s(i)=mean(FFM(G_s,TN*i,1,t),1)*TN*i;
    % Progressbar(k,i) is just a neat visualization function for the
    % progress of the meanplotter function. It shows a progress bar! (who
    % would've thought??)
    progressbar(k,i);
    
end
p=1:k;
% p is the vector which stores the different Theta's
p=p*TN;
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


text