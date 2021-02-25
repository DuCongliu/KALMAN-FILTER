close all;
clear all;
clc
r=0.01;
% y=[49.979 50.025 50 50.003 49.994 50.002 49.999 50.006 49.998 49.991];
a=linspace(0,30,1000);
% z=sawtooth(a)+ rand(1,1000);
z=sin(a);
%ªì©l­È
% xkf=zeros(1,11);
x=zeros(12,12);
p=zeros(12,12);
% pkf=zeros(1,11);
% k=zeros(1,11);
x(1,1)=10;
p(1,1)=10000;
q=0.001;
% 
for i=2:1000
    j=i-1;
%  extrapolation
x(i,j)=x(i-1,j);
p(i,j)=p(i-1,j)+q;
k(i)=p(i,j)/(p(i,j)+r);
% update
p(i,j+1)=(1-k(i))*p(i,j);
x(i,j+1)=x(i,j)+k(i)*(z(i)-x(i,j));
end
% figure
i=1:1000;
% plot(i,y)
hold on
n=1:1000;
plot(n,z)
hold on
for i=1:1000
    m(i)=i;
px(i)=x(i,i);
end

hold on
plot(m,px)
ylim([-2 2])

xlabel('Times'),ylabel('Height')
legend('Measurements','Estimates')
