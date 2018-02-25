%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape d'initialisation
%
%       Génère des individus aléatoire
%       dans les limites du problème
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = Initialisation(ProblemParameters,GAParameters)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
N = GAParameters.PopSize;
Po = zeros(N,size(A,2));

%-----------------------------------------
%   Génération d'une population aléatoire
%   entre les bornes du problème
%-----------------------------------------
for i = 1:size(A,2)
        
    Po(1:N,i) = A(i)+(B(i)-A(i))*rand(N,1);

end