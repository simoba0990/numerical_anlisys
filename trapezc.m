function int = trapezc(a,b,m,fun)
H=(b-a)/m;
x=a:H:b;
y=fun(x);
int=(H/2)*(y(1)+2*sum(y(2:m))+y(m+1));
end