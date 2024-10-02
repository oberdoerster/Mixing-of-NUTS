%Produces Figure 5 with the results of nuts_norm.m

close all;
clear all;

n_dim=1e4;
init=load('init_small.mat').init;


x2_vec = load('x2_vec_10.mat').x2_vec;
domain=(n_dim-10*sqrt(n_dim):1:n_dim+10*sqrt(n_dim));

figure(1); hold on;
histogram(x2_vec(2:3,:),(n_dim-10*sqrt(n_dim):25:n_dim+10*sqrt(n_dim)),'Normalization','pdf','FaceColor','k');
plot(domain,chi2pdf(domain,n_dim),'k','LineWidth',5);
plot(norm(init)^2,0,'k.','MarkerSize',80);
set(gca,'fontsize', 25);
xlim([n_dim-6*sqrt(n_dim) n_dim+6*sqrt(n_dim)]);
ylim([0 0.003]);
box on;
grid on;
xticks([n_dim-4*sqrt(n_dim) n_dim-2*sqrt(n_dim) n_dim n_dim+2*sqrt(n_dim) n_dim+4*sqrt(n_dim)]);
set(gcf,'color',[1.0,1.0,1.0]);
set(gca,'ytick',[]);


x2_vec = load('x2_vec_11.mat').x2_vec;
domain=(n_dim-10*sqrt(n_dim):1:n_dim+10*sqrt(n_dim));

figure(2); hold on;
histogram(x2_vec(26:51,:),(n_dim-10*sqrt(n_dim):25:n_dim+10*sqrt(n_dim)),'Normalization','pdf','FaceColor','k');
plot(domain,chi2pdf(domain,n_dim),'k','LineWidth',5);
plot(norm(init)^2,0,'k.','MarkerSize',80);
set(gca,'fontsize', 25);
xlim([n_dim-6*sqrt(n_dim) n_dim+6*sqrt(n_dim)]);
ylim([0 0.003]);
box on;
grid on;
xticks([n_dim-4*sqrt(n_dim) n_dim-2*sqrt(n_dim) n_dim n_dim+2*sqrt(n_dim) n_dim+4*sqrt(n_dim)]);
set(gcf,'color',[1.0,1.0,1.0]);
set(gca,'ytick',[]);


x2_vec = load('x2_vec_5.mat').x2_vec;
domain=(n_dim-10*sqrt(n_dim):1:n_dim+10*sqrt(n_dim));

figure(3); hold on;
histogram(x2_vec(636:661,:),(n_dim-10*sqrt(n_dim):25:n_dim+10*sqrt(n_dim)),'Normalization','pdf','FaceColor','k');
plot(domain,chi2pdf(domain,n_dim),'k','LineWidth',5);
plot(norm(init)^2,0,'k.','MarkerSize',80);
set(gca,'fontsize', 25);
xlim([n_dim-6*sqrt(n_dim) n_dim+6*sqrt(n_dim)]);
ylim([0 0.003]);
box on;
grid on;
xticks([n_dim-4*sqrt(n_dim) n_dim-2*sqrt(n_dim) n_dim n_dim+2*sqrt(n_dim) n_dim+4*sqrt(n_dim)]);
set(gcf,'color',[1.0,1.0,1.0]);
set(gca,'ytick',[]);


x2_vec = load('x2_vec_99.mat').x2_vec;
domain=(n_dim-10*sqrt(n_dim):1:n_dim+10*sqrt(n_dim));

figure(4); hold on;
histogram(x2_vec(1976:2001,:),(n_dim-10*sqrt(n_dim):25:n_dim+10*sqrt(n_dim)),'Normalization','pdf','FaceColor','k');
plot(domain,chi2pdf(domain,n_dim),'k','LineWidth',5);
plot(norm(init)^2,0,'k.','MarkerSize',80);
set(gca,'fontsize', 25);
xlim([n_dim-6*sqrt(n_dim) n_dim+6*sqrt(n_dim)]);
ylim([0 0.003]);
box on;
grid on;
xticks([n_dim-4*sqrt(n_dim) n_dim-2*sqrt(n_dim) n_dim n_dim+2*sqrt(n_dim) n_dim+4*sqrt(n_dim)]);
set(gcf,'color',[1.0,1.0,1.0]);
set(gca,'ytick',[]);
ax.YAxis.Exponent=4;