function [yappr,t] = onestep(t0,y0,tf,N,tol,itmax,net,f,df)
t=linspace(t0,tf,N+1);
h=(tf-t0)/N;
m=length(y0);
yappr=zeros(m,N+1);
u=y0;
yappr(:,1)=u;
switch net
    case 1   
        for k=2:N+1
            u=u+h*f(t(k),u);
            yappr(:,k)=u;
        end
    case 2   
        for k=2:N+1
            u=eulimp(t(k),u,h,f,df,tol,itmax);
            yappr(:,k)=u;
        end
    case 3  
        for k=2:N+1
            u=cranknic(t(k),u,h,f,df,tol,itmax);
            yappr(:,k)=u;
        end
    case 4    %Heun
        for k=2:N+1
            u=u+(h/2)*(f(t(k-1),u)+f(t(k),u+h*f(t(k-1),u)));
            yappr(:,k)=u;
        end
    case 5  
        for k=2:N+1
            u=u+h*f(t(k)+h/2,u+(h/2)*f(t(k),u));
            yappr(:,k)=u;
        end
    case 6  
        for k=2:N+1
            K1=f(t(k-1),u);
            K2=f(t(k-1)+h/2,u+(h*K1)/2);
            K3=f(t(k-1)+h/2,u+(h*K2)/2);
            K4=f(t(k),u+h*K3);
            u=u+(h/6)*(K1+2*K2+2*K3+K4);
            yappr(:,k)=u;
        end
end
end