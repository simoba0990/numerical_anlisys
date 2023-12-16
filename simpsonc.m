function int = simpsonc(a,b,m,fun)
H=(b-a)/m;
x=a:H/2:b;
y=fun(x);
int=(H/6)*(y(1)+4*sum(y(2:2:2*m))+2*sum(y(3:2:2*m-1))+y(2*m+1));
end