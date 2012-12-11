function [] = visualize_single(data)

figure
hold off
title(['\Theta = ',num2str(data.Theta),', Sim Time = ',num2str(data.Sim_Time),', Grid Size = ',num2str(data.Grid_Size)])
subplot(2,2,1)
plot(data.Number_of_trees)
xlabel('Timesteps')
ylabel('Number of trees alive')
subplot(2,2,2)
plot(data.Fire_size_evolution)
xlabel('Fire incidents')
ylabel('Fire size')
subplot(2,2,3)
hist(data.Fire_size_evolution,20);
xlabel('# of Fires')
ylabel('Fire size')
















end
