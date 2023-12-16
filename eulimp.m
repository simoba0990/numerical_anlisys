function [un,tn,it] = eulimp(t,u,h,f,jac,tol,itmax)
tn=t+h;
[un,it,~]=newtonsys(@(y) y-h*f(tn,y)-u,@(y) eye(length(u))-h*jac(tn,y),u,tol,itmax,1);
end