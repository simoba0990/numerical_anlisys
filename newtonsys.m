function [x,iter,errvec] = newtonsys(Ffun,Jfun,x0,tol,nmax,p)
%Funzione che implementa il metodo di Newton modificato per la risoluzione
%di sistemi di equazioni non lineari
iter=0;
x=x0;
err=tol+1;
errvec=[];
J=Jfun(x);
[L,U,P]=lu(J);
step=0;
while err>tol && iter<nmax
    if step==p
        step=0;
        J=Jfun(x);
        [L,U,P]=lu(J);
    end
    F=Ffun(x);
    iter=iter+1;
    step=step+1;
    F=-P*F;
    y=forwardrow(L,F);
    delta=backwardrow(U,y);
    x=x+delta;
    err=norm(delta);
    errvec=[errvec,err];
end
end