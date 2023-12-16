function [alpha,beta] = thomas(a,b,c) %a rappresenta il vettore della diagonale principale, b della diagonale inferiore
                                      %c della diagonale superiore della
                                      %matrice A
%function che implementa Thomas       
n=size(a);
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