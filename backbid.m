function x = backbid(alpha,c,f) %risoluzione all'indietro sistema bidiagonale Ux=y con metodo Thomas
[n,m]=size(f);
x=zeros(n,1);
x(n)=f(n)/alpha(n);
for i=n-1:-1:1
    x(i)=(f(i)-c(i)*x(i+1))/alpha(i);
end
end