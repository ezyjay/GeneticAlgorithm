%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Three Point Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = ThreeParent(GAParameters, MPbinary)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
l = GAParameters.NbGenes;
C = GAParameters.NumberOfChromosomes;
pc = GAParameters.Pc;

Enfants = cell(N,1);
E1 = [];
nbEnfants = 1;

%-----------------------------------------
%	Parcours des parents 3 par 3
%-----------------------------------------
for i = 1:3:N
    
    %Sélection des couples de parents 
    binP1 = MPbinary{i};
    if(i+1 < N)
        binP2 = MPbinary{i+1};
        binP3 = MPbinary{i+2};
    else
        binP2 = binP1;
        binP3 = binP1;
    end
    
    %Crossover avec probabilité de croisement pc
    if(rand <= pc)
        for j = 1:C
            for k = 1:l
                if(binP1(j,k) == binP2(j,k))
                    E1 = [E1 binP1(j,k)];
                else
                    E1 = [E1 binP3(j,k)];
                end
            end
            Enfants{nbEnfants,1} = [Enfants{nbEnfants,1} ; E1];
            E1 = [];
        end
    else
        Enfants{nbEnfants,1} = binP1;
    end
    
    nbEnfants = nbEnfants+1;
end

while (nbEnfants ~= N+1)
    Enfants{nbEnfants,1} = MPbinary{nbEnfants,1};
    nbEnfants = nbEnfants+1;
end