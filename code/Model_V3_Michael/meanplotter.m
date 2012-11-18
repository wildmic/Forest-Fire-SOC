function [] =meanplotter(G_s,TN,k,t)
s(k)=0;
% This function simulates a forest fire model on a grid size of G_s and a
% theta ranging from Theta_Null (TN) to Theta_Null*k in k steps. It
% simulates for t timesteps. The growth rate is always set to one.
% 
% 


for i=1:k
    N=FFM(G_s,TN*i,1,t);
    s(i)=mean(N(1))*TN*i;
    fac(i)=mean(N(2))/(G_s*G_s-mean(N(2)));
    sf(i)=s(i)*fac(i);
  %s(i)=mean(FFM(G_s,TN*i,1,t),1)*TN*i;
    progressbar(k,i);
    
end
p=1:k;
p=p*TN;
subplot(2,2,1),plot(p,sf,'--rs','MarkerSize',10,'MarkerFaceColor','k','MarkerEdgeColor','g')
xlabel('Theta=f/p')
ylabel('MeanBurnAmount*Theta*N/(G-N)')
subplot(2,2,2),plot(p,s,'--rs','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','r')
xlabel('Theta=f/p')
ylabel(' s_bar \cdot \Theta')
subplot(2,2,3),plot(p,fac,'--rs')
xlabel('\Theta = f/p')
ylabel('\frac {N}{G-N}')

subplot

text