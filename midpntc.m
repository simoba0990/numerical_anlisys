function int = midpntc(a,b,m,fun)
H=(b-a)/m;
x=a+H/2:H:b;
y=fun(x);
int=H*sum(y);
end