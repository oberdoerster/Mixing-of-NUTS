function subUturn = indicatorsubUturn(a,b,th0,rh0,step_size,R)
if a==b
    subUturn=0;
else
    m=floor((a+b)/2);
    [all,Hp,Hm]=indicatorUturn(a,b,th0,rh0,step_size,R);
    left=indicatorsubUturn(a,m,th0,rh0,step_size,R);
    right=indicatorsubUturn(m+1,b,th0,rh0,step_size,R);
    subUturn=max([all,left,right]);
end
end