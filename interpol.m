function y1 = interpol(x,y,x1) &calcola il pol interpolatore di Lagrange con la formula delle differenze divise di Newton (unicità pol interp)
x=x(:);                        &converte matrice o vettore riga in colonne concatenate (se matrice una sotto l'altra)
y=y(:);                        &x1 contiene le ascisse nelle quali si vuole calcolare il polinomio	
n1=length(x1);                 &x e y sono i vettori rispettivamente dei nodi e delle osservazioni 
y1=zeros(size(x1));
np=length(y);
d=zeros(np,np);
d(:,1)=y;
for j=2:np
    for i=j:np
        d(i,j)=(d(i-1,j-1)-d(i,j-1))/(x(i-j+1)-x(i));
    end
end
for i=1:n1
    y1(i)=d(np,np);
    for j=np-1:-1:1
        y1(i)=y1(i)*(x1(i)-x(j))+d(j,j);
    end
end
end