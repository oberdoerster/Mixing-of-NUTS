%Runs simulations for Figure 4 and saves results.  The figure can then be
%produced with figure4_plot.m

clear all;
close all;

%Set parameters of the 3 experiments
n_realizations=100;
n_dim=1e4;
M=10;
R=1;
h_vec=[0.09 0.1 0.11];
n_steps_vec=[50 3 50];
label_vec=[09 10 11];

tic

%Loop through the 3 experiments
for ooi=1:3

h=h_vec(ooi);
n_steps=n_steps_vec(ooi);

%Create data matrices for: r the distance between the copies, L, L_tilde the path length index of the copies, and OL, OL_tilde the orbit length of the copies
r_vec=zeros(n_steps+1,n_realizations);
L_vec=zeros(n_steps,n_realizations); L_tilde_vec=zeros(n_steps,n_realizations);
OL_vec=zeros(n_steps,n_realizations); OL_tilde_vec=zeros(n_steps,n_realizations);

%Parallel loop through independent runs
parfor oi=1:n_realizations

%Initialize copies
th0=randn(n_dim,1); th0_tilde=randn(n_dim,1);
%Create data vectors for current run
r_vec_0=zeros(n_steps+1,1); r_vec_0(1,1)=norm(th0-th0_tilde);
L_vec_0=zeros(n_steps,1); L_tilde_vec_0=zeros(n_steps,1);
OL_vec_0=zeros(n_steps,1); OL_tilde_vec_0=zeros(n_steps,1);

%Make synchronously coupled NUTS transitions and fill data vetors
for i=1:n_steps
    [th1,L,OL,th1_tilde,L_tilde,OL_tilde]=nuts_sync_coupling(th0,th0_tilde,h,R,M);
    r_vec_0(i+1,1)=norm(th1-th1_tilde);
    L_vec_0(i,1)=L; L_tilde_vec_0(i,1)=L_tilde;
    OL_vec_0(i,1)=OL; OL_tilde_vec_0(i,1)=OL_tilde;
    th0=th1; th0_tilde=th1_tilde;
end

%Insert data vectors of run into total data matrices
r_vec(:,oi)=r_vec_0; L_vec(:,oi)=L_vec_0; L_tilde_vec(:,oi)=L_tilde_vec_0;
OL_vec(:,oi)=OL_vec_0; OL_tilde_vec(:,oi)=OL_tilde_vec_0;
end

%Save data matrices
label=label_vec(ooi);
my_filename_r=sprintf('r_vec_%d', label);
my_filename_L=sprintf('L_vec_%d', label);
my_filename_OL=sprintf('OL_vec_%d', label);
save(my_filename_r,'r_vec');
save(my_filename_L,'L_vec');
save(my_filename_OL,'OL_vec');
end

toc
