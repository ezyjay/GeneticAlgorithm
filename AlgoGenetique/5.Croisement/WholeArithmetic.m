%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Whole Arithmetic Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = WholeArithmetic(GAParameters, MP)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
pc = GAParameters.Pc;
Enfants = [];

%Même nombre aléatoire pour tout les couples de parents
a = rand;

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:N
    
    %Sélection des couples de parents 
    P1 = MP(i,1:2);
    if(i < N)
        P2 = MP(i+1,1:2);
    else
        P2 = P1;
    end
    
    %Crossover avec probabilité de croisement pc
    if(rand < pc)
        E1 = [(a*P1(1,1) + (1-a)*P2(1,1)) (a*P1(1,2) + (1-a)*P2(1,2))];
        E2 = [((1-a)*P1(1,1) + a*P2(1,1)) ((1-a)*P1(1,2) + a*P2(1,2))];
    else
        E1 = P1;
        E2 = P2;
    end
    
    %On retourne les enfants
    Enfants = [Enfants; E1; E2];
end