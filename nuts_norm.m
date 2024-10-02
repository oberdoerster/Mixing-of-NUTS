%Runs simulations for Figure 5 and saves results.  The figure can then be
%produced with plot_indexfigure.m

clear all;
close all;

n_dim=1e4;
M=10;
R=1;

h_vec=[0.1 0.11 0.5 1];
n_realizations_vec=[12 100 100 100];
n_steps_vec=[2 50 660 2000];
label_vec=[10 11 5 99];

tic

for ooi=1:4

init=load('init_small.mat').init;

h=h_vec(ooi);
n_realizations=n_realizations_vec(ooi);
n_steps=n_steps_vec(ooi);

x2_vec=zeros(n_steps+1,n_realizations);
L_vec=zeros(n_steps,n_realizations);
OL_vec=zeros(n_steps,n_realizations);

parfor oi=1:n_realizations

th0=init;
x2_vec_0=zeros(n_steps+1,1); x2_vec_0(1,1)=th0'*th0;
L_vec_0=zeros(n_steps,1); OL_vec_0=zeros(n_steps,1);

for i=1:n_steps
    [th1,L,OL]=nuts(th0,h,R,M);
    x2_vec_0(i+1,1)=th1'*th1;
    L_vec_0(i,1)=L;
    OL_vec_0(i,1)=OL;
    th0=th1;
end

x2_vec(:,oi)=x2_vec_0; L_vec(:,oi)=L_vec_0; OL_vec(:,oi)=OL_vec_0;
end

label=label_vec(ooi);
my_filename=sprintf('x2_vec_%d', label);
save(my_filename,'x2_vec');
end

toc