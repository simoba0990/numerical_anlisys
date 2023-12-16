function [un,tn,it] = cranknic(t,u,h,f,jac,tol,itmax)
tn=t+h;
[un,it,~]=newtonsys(@(y) y-(h/2)*(f(t,u)+f(tn,y))-u,@(y) eye(length(u))-(h/2)*(jac(t,u)+jac(tn,y)),u,tol,itmax,1);
end