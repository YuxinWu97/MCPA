set(0,'defaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'Defaultaxesfontname','Time New Roman')
set(0,'DefaultLineLineWidth',2)
clear all
close all
x=0;
xpv=0;
v=0;
F=1;
m=1;
dt=1;
step=1000;
a=1;
v=zeros(a,1);
x=zeros(a,1);
t=0;
re = -1;
for i=2:step
    t(i)=t(i-1)+dt;
    v(:,i)=v(:,i-1)+F/m+dt;
    x(:,i)=x(:,i-1)+v(:,i-1)+dt+F/m+dt^2/2;
    r=rand(a,1)<0.05;
    v(r,i)=re*v(r,i);
    AveV(i,:)=mean(v,2);
    %Velocity vs Time
    subplot(3,1,1),plot(t,v);
    hold on
    subplot(3,1,1),plot(t,AveV,'g');
    hold off
    xlabel('time');
    ylabel('v');
    title(['Average v:' num2str(AveV(i))]);
    %Velocity vs position
    subplot(3,1,2),plot(x(1,:),v(1,:));
    hold on
    subplot(3,1,2),plot(x(1,:),AveV,'g');
    hold off
    xlabel('x');
    ylabel('v');
    %position vs time
    subplot(3,1,3),plot (t,x);
    xlabel('time');
    ylabel('x')
    pause(0.01)
end
display('Average V')
mean(v)