%q1为内侧膨胀力
%R为外圆半径
%长度单位毫米
function totalr = foil( q1,R)
%E：×10^4N/mm^2
E=3*10^4; u=0.16; d=20; l=10;q2=0;
result =[];
rresult=[];
totalr=0;
step = 0.1;
n=l/step;
for dx=0:step:l
    
    %计算各个参数
    r=sqrt(d^2+dx^2); 
    A=(r^2 * R^2*(q2-q1))/(R^2-r^2);
    C=(q1*r^2-q2*R^2)/(R^2-r^2);
    angle = atand(dx/d);

    %计算位移分量
    tmpu=getup(E,A,C,u,r)*sind(angle);  
    result=[result;tmpu];    
    
    %计算电阻
    totalr =totalr + ((step+tmpu)^2)/(step*l);    
end
plot(result);
totalr = totalr-1 ;
end

%计算一个点的up
function up=getup(E,A,C,u,r)
up=(1/E)*(-(1+u)*A/r+2*(1-u)*C*r);
end