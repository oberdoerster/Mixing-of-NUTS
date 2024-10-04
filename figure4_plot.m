%Produces the three plots of Figure 4 from the results of figure4_data.m

clear all;
close all;

h=0.09;
r_vec = load('r_vec_09.mat').r_vec;
OL_vec = load('OL_vec_09.mat').OL_vec;
L_vec = load('L_vec_09.mat').L_vec;
mean_r_vec=mean(r_vec,2);

figure(1); hold on;
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'k','LineWidth',10);
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'.','Color','k','MarkerSize',60);
set(gca,'fontsize', 25);
xlim([0 1500]);
ylim([1e-8 150]);
box on;
grid on;
set(gca,'yscale','log')
axes('Position',[.2 .2 .3 .3]);
hold on;
box on;
histogram(h*L_vec,(-2*pi:4*h:2*pi),'FaceColor','k','Normalization','pdf');
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})
set(gca,'fontsize', 20);
set(gca,'ytick',[])


h=0.10;
r_vec = load('r_vec_10.mat').r_vec;
OL_vec = load('OL_vec_10.mat').OL_vec;
L_vec = load('L_vec_10.mat').L_vec;
mean_r_vec=mean(r_vec,2);

figure(2); hold on;
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'k','LineWidth',10);
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'.','Color','k','MarkerSize',60);
set(gca,'fontsize', 25);
xlim([0 1500]);
ylim([1e-8 150]);
box on;
grid on;
set(gca,'yscale','log')
axes('Position',[.2 .2 .3 .3]);
hold on;
box on;
histogram(h*L_vec,(-32*pi:64*h:32*pi),'FaceColor','k','Normalization','pdf');
xticks([-32*pi 0 32*pi])
xticklabels({'-32\pi','0','32\pi'})
set(gca,'fontsize', 20);
set(gca,'ytick',[])


h=0.11;
r_vec = load('r_vec_11.mat').r_vec;
OL_vec = load('OL_vec_11.mat').OL_vec;
L_vec = load('L_vec_11.mat').L_vec;
mean_r_vec=mean(r_vec,2);

figure(3); hold on;
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'k','LineWidth',10);
plot([0 (cumsum(mean(OL_vec,2))/h).'],mean_r_vec,'.','Color','k','MarkerSize',60);
set(gca,'fontsize', 25);
xlim([0 1500]);
ylim([1e-8 150]);
box on;
grid on;
set(gca,'yscale','log')
axes('Position',[.2 .2 .3 .3]);
hold on;
box on;
histogram(h*L_vec,(-2*pi:4*h:2*pi),'FaceColor','k','Normalization','pdf');
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})
set(gca,'fontsize', 20);
set(gca,'ytick',[])
