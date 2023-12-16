function [s,z] = s3nat(x,y)
np=length(x);
h=zeros(np-1,1);
d=zeros(np-2,1);
M=zeros(np-2,1);
for i=1:np-1
    h(i)=x(i+1)-x(i);
end
for i=1:np-2
    d(i)=(6/(h(i)+h(i+1)))*((y(i+2)-y(i+1))/h(i+1)-(y(i+1)-y(i))/h(i));
end
a=4*ones(np-2,1);
b=ones(np-3,1);
[athomas,bthomas]=thomas(a,b,b);
f=zeros(np-2,1);
f=forwbid(bthomas,d);
M=backbid(athomas,b,f);
z=zeros(np-1,1);
for i=1:np-1
    z(i)=(x(i)+x(i+1))/2;
end
M=[0;M;0];
for i=1:np-1
    s(i)=M(i)*((x(i+1)-z(i))^3)/(6*h(i))+M(i+1)*((z(i)-x(i))^3)/(6*h(i))+(y(i)-(M(i)*(h(i)^2))/6)*(x(i+1)-z(i))/h(i)+(y(i+1)-(M(i+1)*(h(i)^2))/6)*(z(i)-x(i))/h(i);
end
