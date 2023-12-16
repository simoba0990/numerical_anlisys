function [x] = forwbid(beta,f)
%Funzione che risolve un sistema lineare con matrice dei coefficienti
%bidiagonale inferiore
[n, m]=size(f);
x=zeros(n,1);
beta=[0;beta];
x(1)=f(1);
for i=2:n
    x(i)=f(i)-beta(i)*x(i-1);
end
end