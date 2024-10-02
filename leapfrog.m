function [th1,rh1,Hmax,Hmin] = leapfrog(th0,rh0,L,step_size)
force = @(th) -th;
H=@(th,rh) 0.5*(rh'*rh+th'*th);
hh=step_size; hh2=hh*hh;
H0=H(th0,rh0); Hmin=H0; Hmax=H0;
th1=th0; rh1=rh0;
if (L<0)
    rh0=-rh0;
end
F0=force(th0);
for j=0:abs(L)-1

    th1=th0+hh*rh0+0.5*hh2*F0;
    F1=force(th1);
    rh1=rh0+0.5*hh*(F0+F1);

    H1=H(th1,rh1); Hmax=max(Hmax,H1); Hmin=min(Hmin,H1);
    th0=th1; rh0=rh1; F0=F1;

end
if (L<0)
    rh1=-rh1;
end
end