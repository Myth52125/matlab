R=2;
theta=pi/6;
w=0.1;
[t,y]=ode23('dhyxhfun',[0:0.2:100],[theta,w],[],pi/3);
figure
axis([-6 6 -6 6,-1,1])
hold on
axis equal;
box on
view(3);
phi=0:0.1:2*pi;
yh=R*sin(phi);
xh=R*cos(phi);
DY=line(R+xh,yh,'linestyle','-','color','b','linewidth',3,'erasemode','xor');
SY=line(R+R*cos(theta),R*sin(theta),'color','r','marker','o','markersize',10,'linewidth',2,'erasemode','xor');
L=line([0,2*R],[0,0],'color','k','erasemode','xor');
for i=1:2:500
    set(DY,'Xdata',xh+R*cos(w*t(i)),'Ydata',yh+R*sin(w*t(i)));
    set(SY,'Xdata',R*cos(y(i,1)+w*t(i))+R*cos(w*t(i)),'Ydata',R*sin(y(i,1)+w*t(i))+R*sin(w*t(i)));
    set(L,'Xdata',[0,2*R*cos(w*t(i))],'Ydata',[0,2*R*sin(w*t(i))]);
    drawnow;
    pause(0.01)
end
