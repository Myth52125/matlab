function ydot=dhyxhfun(t,y,flag,omega)
ydot=[y(2);
    -omega^2*sin(y(1))];