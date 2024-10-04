%One transition of synchronously coupled copies of NUTS
%Inputs:  th0,th0_tilde initial states of the copies
%         step_size and reduction factor R yielding en effective step size of step_size/R
%         M maximal number of iterations in the orbit selection
%Outputs: thstar,thstar_tilde new states of the copies
%         L,L_tilde path length indices selected in the transitions
%         OL,OL_tilde physical time lengths of orbits selected in the transitions

function [thstar, L, OL, thstar_tilde, L_tilde, OL_tilde] = nuts_sync_coupling(th0,th0_tilde,step_size,R,M)

d=length(th0);
rh0=randn(d,1);
B=randi([0,1],M,1);

[a,b,deltaHgap]=leapfrogorbitselection(th0,rh0,B,step_size,R);
[a_tilde,b_tilde,deltaHgap_tilde]=leapfrogorbitselection(th0_tilde,rh0,B,step_size,R);
bma=b-a;
bma_tilde=b_tilde-a_tilde;
OL=bma*step_size; OL_tilde=bma_tilde*step_size;
U=rand([max(bma,bma_tilde),1]);
[thstar,rhstar,L]=leapfrogindexselection(th0,rh0,a,b,step_size,R,U); 
[thstar_tilde,rhstar_tilde,L_tilde]=leapfrogindexselection(th0_tilde,rh0,a_tilde,b_tilde,step_size,R,U);
end
