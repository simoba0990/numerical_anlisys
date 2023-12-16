function y1 = interpol(x,y,x1)
%Funzione che, data una tabella di nodi e un insieme di ascisse, calcola il
%valore del polinomio intepolatore per i nodi nelle ascisse
x=x(:);
y=y(:);
n1=length(x1);
y1=zeros(size(x1));
np=length(y); %np=n+1
d=zeros(np,np); %tabella delle differenze divise, quelle da usare saranno sulla diagonale
d(:,1)=y;
for j=2:np
    for i=j:np
        d(i,j)=(d(i-1,j-1)-d(i,j-1))/(x(i-j+1)-x(i));
    end
end
for i=1:n1 %metodo di Horner adattato
    y1(i)=d(np,np);
    for j=np-1:-1:1
        y1(i)=y1(i)*(x1(i)-x(j))+d(j,j);
    end
end
end