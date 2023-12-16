function [A] = lukji(A)
%function che effettua la fattorizzazione LU
%U è memorizzara direattamente nella parte triangolare superiore di A(diagonale inclusa)
%mentre L nella parte triangolare inferiore stretta, sapendo che i valori sulla diag sono pari a 1 
%sovrascriviamo direttamente su A, L=tril(A,-1)+eye(n), U=triu(A)
n=size(A,1);
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k); %costruzione moltiplicatore
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j); %aij - moltiplicatore*akj
        end
    end
end
end