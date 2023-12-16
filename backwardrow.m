function x = backwardrow(U,b) &risoluzione sistema lineare a partire da matrice triangolare superiore
n=size(U,1);
x=zeros(n,1);
if n==1
    x=b./U;
else
    for i=n:-1:1
        x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
    end
end
end