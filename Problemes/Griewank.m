%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Griewank
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function g = Griewank(x,y)
  
[X,Y] = meshgrid(x,y);

%Fonction
g = (power(X,2)+power(Y,2))/4000 - cos(X).*cos(Y/sqrt(2)) +1;