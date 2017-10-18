%q1Ϊ�ڲ�������
%RΪ��Բ�뾶
%���ȵ�λ����
function totalr = foil( q1,R)
%E����10^4N/mm^2
E=3*10^4; u=0.16; d=20; l=10;q2=0;
result =[];
rresult=[];
totalr=0;
step = 0.1;
n=l/step;
for dx=0:step:l
    
    %�����������
    r=sqrt(d^2+dx^2); 
    A=(r^2 * R^2*(q2-q1))/(R^2-r^2);
    C=(q1*r^2-q2*R^2)/(R^2-r^2);
    angle = atand(dx/d);

    %����λ�Ʒ���
    tmpu=getup(E,A,C,u,r)*sind(angle);  
    result=[result;tmpu];    
    
    %�������
    totalr =totalr + ((step+tmpu)^2)/(step*l);    
end
plot(result);
totalr = totalr-1 ;
end

%����һ�����up
function up=getup(E,A,C,u,r)
up=(1/E)*(-(1+u)*A/r+2*(1-u)*C*r);
end