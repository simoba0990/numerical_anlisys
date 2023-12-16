function [x,iter] = jacobiIncr(A,b,x0,nmax,tol)
n=size(A,1);
iter=0;
err=tol+1;
x=zeros(n,1);
while iter<nmax && err>tol
    iter=iter+1;
    for i=1:n
        x(i)=(b(i)-A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
    end
    err=norm((x-x0),"inf");
    x0=x;
end
end