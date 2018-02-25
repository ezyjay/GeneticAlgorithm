%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Changement d'échelle linéaire
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Fitness = ChEchelleLineaire(P,N)

%-----------------------------------------
%   Init variables
%-----------------------------------------
fmoy = mean(P(:,3));
fmin = min(P(:,3));
fmax = max(P(:,3));
Fitness = zeros(N,1);


%-----------------------------------------
%   Parcours de la population
%-----------------------------------------
for i = 1:N
    
    Fitness(i,1) = P(i,3)*fmoy / (fmoy-fmin) + fmoy*fmin / (fmax-fmin);
    
end