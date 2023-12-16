function [x]= backwardrow(U,b)
%function che risolve un sistema lineare quadrato triangolare superiore
n=size(U,1); %ritorna size della prima dimensione della matrice, ossia delle righe
x=zeros(n,1); %inizializziamo il vettore x a zero (sarà il nostro output)
for i=n:-1:1
    x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end
return