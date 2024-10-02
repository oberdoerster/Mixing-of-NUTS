function [thstar,rhstar,L] = leapfrogindexselection(th0,rh0,a,b,step_size,R,U)
H=@(th,rh) 0.5*(rh'*rh+th'*th);
[tthstar,trhstar,Hp,Hm]=leapfrog(th0,rh0,R*a,step_size/R);
Hvec=zeros(b-a+1,1);
tHstar=H(tthstar,trhstar); w=exp(-tHstar); L=a; thstar=tthstar; rhstar=trhstar;
Hvec(1)=tHstar; j=2;
for i=a+1:b
    [tthstar,trhstar,Hp,Hm]=leapfrog(tthstar,trhstar,R,step_size/R);
    tHstar=H(tthstar,trhstar); Hvec(j)=tHstar; w=logsumexp(-Hvec(1:j)); log_ap=-tHstar-w;
    u=U(i-a);
    if (log(u) <= log_ap)
        L=i;
        thstar=tthstar; rhstar=trhstar;
    end
    j=j+1;
end
end