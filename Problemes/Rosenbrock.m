%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Rosenbrock
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function r = Rosenbrock(x,y)
   
[X,Y] = meshgrid(x,y);

%Fonction
r = -((1-power(X,2)) + 100.*power(Y-power(X,2),2));