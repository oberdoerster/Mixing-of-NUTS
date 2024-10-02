function [a,b,deltaHgap] = leapfrogorbitselection(th0,rh0,B,step_size,R)

H=@(th,rh) 0.5*(rh'*rh+th'*th);
a=0; b=0; H0=H(th0,rh0); Hp=H0; Hm=H0; deltaHgap=0.0;
force = @(x) -x;
hh=step_size; hh2=hh*hh;
M=length(B);

for j=1:M
    Bj=B(j);
    ta=a+(-1)^Bj*2^(j-1);
    tb=b+(-1)^Bj*2^(j-1);
    [Uturn,tHp,tHm]=indicatorUturn(a,b,th0,rh0,step_size,R);
    Hp=max(Hp,tHp); Hm=min(Hm,tHm);
    subUturn=indicatorsubUturn(ta,tb,th0,rh0,step_size,R);
    if max(Uturn,subUturn)==0
        a=min(a,ta); b=max(b,tb);
    else
        break;
    end
end
deltaHgap=Hp-Hm;
    
end