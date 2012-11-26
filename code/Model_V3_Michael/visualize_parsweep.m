function [] = visualize_parsweep(data)

figure
subplot(2,1,1)
plot( data.Theta_vector,data.Mean_tree)
xlabel('\Theta')
ylabel('Mean # of trees alive')
subplot(2,1,2)
plot(data.Theta_vector,data.Mean_fire_size)
xlabel('\Theta')
ylabel('Mean Fire Size')











end