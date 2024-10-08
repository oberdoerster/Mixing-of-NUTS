%One transition of NUTS
%Inputs:  th0 initial state
%         step_size and reduction factor R yielding en effective step size of step_size/R
%         M maximal number of iterations in the orbit selection
%Outputs: thstar new state
%         L path length index selected in the transition
%         OL physical time length of orbit selected in the transition

function [thstar, L, OL] = nuts(th0,step_size,R,M)

d=length(th0);
rh0=randn(d,1);
B=randi([0,1],M,1);

[a,b,deltaHgap]=leapfrogorbitselection(th0,rh0,B,step_size,R);
bma=b-a;
OL=bma*step_size;
U=rand([bma,1]);
[thstar,rhstar,L]=leapfrogindexselection(th0,rh0,a,b,step_size,R,U); 
end
