%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Single Point Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = SinglePoint(GAParameters, MPbinary)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
l = GAParameters.NbGenes;
pc = GAParameters.Pc;

Enfants = cell(GAParameters.PopSize,1);

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:N
    
    %Sélection des couples de parents 
    binP1 = MPbinary{i};
    if(i < N)
        binP2 = MPbinary{i+1};
    else
        binP2 = binP1;
    end
    
    %Point de croisement aléatoire
    r = randi([1, l-1]);
    
    %Crossover avec probabilité de croisement pc
    if(rand <= pc)
        Enfants{i,1} = [binP1(1,1:r) binP2(1,r+1:end); binP1(2,1:r) binP2(2,r+1:end)];
        Enfants{i+1,1} = [binP2(1,1:r) binP1(1,r+1:end); binP2(2,1:r) binP1(2,r+1:end)];
    else
        Enfants{i,1} = binP1;
        Enfants{i+1,1} = binP2;
    end
end