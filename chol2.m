function [A] = chol2(A)
%function che ritorna la matrice della fattorizzazione di Cholesky
n=size(A,1);
A(1,1)=sqrt(A(1,1));
for j=2:n
    for i=1:j-1
        A(i,j)=(A(i,j)-A(1:i-1,i)'*A(1:i-1,j))/A(i,i); %sovrascriviamo direttamente sulla matrice di partenza
    end
    A(j,j)=sqrt(A(j,j)-A(1:j-1,j)'*A(1:j-1,j));
end
A=triu(A); %la matrice di Cholesky H, triangolare superiore, tale che (H^T)H=A
end