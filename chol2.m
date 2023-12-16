function A = chol2(A)   %costo comput (n^2)/3 flops e algo stabile
n=size(A,1);
A(1,1)=sqrt(A(1,1));
for j=2:n   %si fa partire la fattorizzazione di Cholesky
    for i=1:j-1
        A(i,j)=(A(i,j)-A(1:i-1,i)'*A(1:i-1,j))/A(i,i);
    end
    A(j,j)=sqrt(A(j,j)-A(1:j-1,j)'*A(1:j-1,j));
end
A=triu(A); %ritorna la parte di matrice triangolare superiore immagazzinata in A che sarebbe quella di Cholesky mentre A
           %essendo simmetrica contiene nella parte triangolare inferiore i valori inziali di A; i valori della diagonale principale si calcolano
           %facilmente con la formula inversa per i valori della digonale principale della formula di Cholesky
end