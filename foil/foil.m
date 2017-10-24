%q1：内侧膨胀力
%R:外圆半径
%r:内圆半径
%d:圆心到应变片的垂直距离
%l:应变片长度
%step:计算的步长，l/step = 每份的长度

function totalr = foil( q1,R)
%E弹性模量单位10^4N/mm^2
E=3*10^4; u=0.16; d=20; l=10;q2=0;
result =[];
rresult=[];
totalr=0;
step = 0.1;
n=l/step;
for dx=0:step:l
    
    %计算各个长度
    r=sqrt(d^2+dx^2); 
    A=(r^2 * R^2*(q2-q1))/(R^2-r^2);
    C=(q1*r^2-q2*R^2)/(R^2-r^2);
    angle = atand(dx/d);

    %����λ�Ʒ���
    tmpu=getup(E,A,C,u,r)*sind(angle);  
    result=[result;tmpu];    
    
    %叠加各个小段的电阻
    totalr =totalr + ((step+tmpu)^2)/(step*l);    
end
plot(result);
totalr = totalr-1 ;
end

%计算应变的
function up=getup(E,A,C,u,r)
up=(1/E)*(-(1+u)*A/r+2*(1-u)*C*r);
end