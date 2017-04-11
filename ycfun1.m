function y=ycfun1(x)
m=floor([x(2) x(3) x(4) 0 0 0 x(5) x(6) x(7)]);
Y=floor(x(1))
number_T=24;
[P,cost,T]=cellularF(Y,[3 3 3],number_T,3,9,m,10.1,4,8);
y=(624-T)/(624-408)+(T-538.9583)/(539.2917-538.9583)+P;
end


