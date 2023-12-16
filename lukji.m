function A = lukji(A)
%si fattorizza la matrice non singolare A in LU
%Si salva la matrice su A sapendo che nella diag princ sono tutti 1 e che U è triang super e L triang inf
n=size(A,1);
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end
end