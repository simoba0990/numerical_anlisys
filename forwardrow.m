function [x] = forwardrow(L,b)
%Funciotn che risolve sistema lineare quadrato triangolare inferiore
n=size(L,1);       %ritorna la size della prima dimensione, ossia le righe
x=zeros(n,1);
for i=1:n        %ipotizziamo che la matrice sia quadrata, senza verifica
    x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i); %prodotto scalare tra vettore riga della matrice 
                                            %e vettore soluzione calcolato all'iterazione prcedente
end
end