function [x,iter,errvec] = SORResi(A,b,x0,nmax,tol,omega)
n=size(A,1);
iter=0;
x=zeros(n,1);
res=b-A*x0;
err=norm(res)/norm(b);
errvec=zeros(nmax,1);
while iter<nmax && err>tol
    iter=iter+1;
    for i=1:n
        x(i)=(1-omega)*x0(i)+omega*(b(i)-A(i,[1:i-1])*x([1:i-1])-A(i,[i+1:n])*x0([i+1:n]))/A(i,i);
    end
    res=b-A*x;
    err=norm(res)/norm(b);
    errvec(iter)=err;
    x0=x;
end
end