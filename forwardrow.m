function x = forwardrow(L,b) %risoluzione sistema lineare a partire da matrice triangolare inferiore
n=size(L,1);
x=zeros(n,1);
if n==1
    x=b./L;
else
    for i=1:n
       x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))./L(i,i);
    end
end
end