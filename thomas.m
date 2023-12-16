function [alpha,beta] = thomas(a,b,c) %alpha e beta sono i vettori da calcolare perché nella matrice di output abbiamo sempre 1 nella diag princ
n=size(a);                            %e la diagonale superiore a quella principale è data dal vettore c
alpha=zeros(n);
beta=zeros(n);
b=[0;b];
alpha(1)=a(1);
for i=2:n
    beta(i)=b(i)/alpha(i-1);
    alpha(i)=a(i)-beta(i)*c(i-1);
end
beta=beta(2:n);
end