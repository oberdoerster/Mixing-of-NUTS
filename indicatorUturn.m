function [Uturn,Hp,Hm] = indicatorUturn(a,b,th0,rh0,step_size,R)

    [thm,rhm,Hp,Hm]=leapfrog(th0,rh0,R*a,step_size/R);
    [thp,rhp,tHp,tHm]=leapfrog(th0,rh0,R*b,step_size/R);
    
    Hp=max(tHp,Hp); Hm=min(tHm,Hm);
    Uturn=(rhp'*(thp-thm)<0) || (rhm'*(thp-thm)<0);
end