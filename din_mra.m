function dx = din_mra(t,x)
% Variables iniciales
Beq = 4.300;
Bp = 0.0024;
Fc = 0;
g  = 9.81;
Ip = 0.0079;
lp = 0.3302;
Mc = 0.7032;
Mp = 0.2300;

% x(n)
xc    = x(1); 
dxc   = x(2); 
alfa  = x(3); 
dalfa = x(4);

% Denominador (el de ambos es el mismo)
den = (Mc+Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*sin(alfa)^2;

d2xc = ( ...
    + (Ip + Mp*lp^2)*Fc ...
    + Mp^2*lp^2*g*cos(alfa)*sin(alfa) ...
    - (Ip + Mp*lp^2)*Beq*dxc ...
    - (Ip*Mp*lp - Mp^2*lp^3)*dalfa^2*sin(alfa) ...
    - Mp*lp*dalfa*cos(alfa)*Bp ...
    ) / den;

d2alfa = ( ...
    + (Mc+Mp)*Mp*g*lp*sin(alfa) ...
    - (Mc+Mp)*Bp*dalfa ...
    + Fc*Mp*lp*cos(alfa) ... 
    - Mp^2*lp^2*dalfa^2*sin(alfa)*cos(alfa) ... 
    - Beq*Mp*lp*dxc*cos(alfa) ...
    ) / den;

dx = zeros(4,1);
dx(1) = dxc;
dx(2) = d2xc;
dx(3) = dalfa;
dx(4) = d2alfa;
end