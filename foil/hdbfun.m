function ydot=hdbfun(t,y,flag,m1,m2,g,l)
M=m2/(m1+m2);
ydot=[y(2);
    (-M*sin(y(1))*cos(y(1))*y(2)^2-g/l*sin(y(1))/(1-M*cos(y(1))^2));
    y(4);
    (M*g*sin(y(1))*cos(y(1))+M*l*sin(y(1))*y(2)^2)/(1-M*cos(y(1))^2)];