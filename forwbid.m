function x = forwbid(beta,f) %risoluzione in avanti sistema bidiagonale in particolare Ly=f 
[n, m]=size(f);
x=zeros(n,1);
beta=[0;beta];
x(1)=f(1);
for i=2:n
    x(i)=f(i)-beta(i)*x(i-1);
end
end