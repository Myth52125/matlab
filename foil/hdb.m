g=9.8;
m1=4;
m2=2;
l=1;
[t,y]=ode45('hdbfun',[0:0.001:5],[pi/4,0,-l*cos(pi/4)*2/(4+2),0],[ ],m1,m2,g,l);
figure(1)
set(gcf,'unit','normalized','position',[0.03 0.1 0.5 0.5]);
cla;
plot(t,y(:,1),t,y(:,3))
xlabel('Ê±¼ä');
ylabel('Î»ÒÆ');
legend('°Ú´¸','»¬¿é');

figure(2)
set(gcf,'unit','normalized','position',[0.5 0.4 0.5 0.5]);
cla;
axis([-0.6 0.6 -1 0.2]);
axis off
axis equal
hold on 
y1=-l.*cos(y(:,1));
x1=y(:,3)+l.*sin(y(:,1));
xian1=line([-0.6,0.6],[0,0],'linewidth',2);
xian2=line([0,0],[0,-1],'linewidth',2,'linestyle',':');
gan=line([y(1,3),x1(1)],[0,y1(1)],'color','y','linestyle','-','linewidth',3,'erasemode','xor');
kuai=line([y(1,3),x1(1)],[0,y1(1)],'color','y','linestyle','-','linewidth',15,'erasemode','xor');
qiu=line(x1(1),y1(1),'color','r','marker','.','markersize',50,'erasemode','xor');
for i=1:5001
    set(gan,'xdata',[y(i,3),x1(i)],'ydata',[0,y1(i)]);
    set(kuai,'xdata',[y(i,3)-0.05,y(i,3)+0.05],'ydata',[0,0]);
    set(qiu,'xdata',x1(i),'ydata',y1(i))
    drawnow;
end

