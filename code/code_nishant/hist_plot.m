function [x,n]=hist_plot(Clust,Nofsteps)
si=max(max(size(Clust)));
n=hist(Clust,Nofsteps);
x=linspace(0,si,Nofsteps);
plot(x(1:Nofsteps),n(1:Nofsteps))
end