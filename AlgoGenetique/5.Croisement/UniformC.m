%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Uniform Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = UniformC(GAParameters, MPbinary)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
l = GAParameters.NbGenes;
C = GAParameters.NumberOfChromosomes;
pc = GAParameters.Pc;

Enfants = cell(GAParameters.PopSize,1);
E1 = [];
E2 = [];

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
    
    %Crossover avec probabilité de croisement pc
    if(rand <= pc)
        for j = 1:C
            for k = 1:l
                if(rand <= 0.5)
                    E1 = [E1 binP1(j,k)];
                    E2 = [E2 binP2(j,k)];
                else
                    E1 = [E1 binP2(j,k)];
                    E2 = [E2 binP1(j,k)];
                end
            end
            Enfants{i,1} = [Enfants{i,1} ; E1];
            Enfants{i+1,1} = [Enfants{i+1,1} ; E2];
            E1 = [];
            E2 = [];
        end
    else
        Enfants{i,1} = binP1;
        Enfants{i+1,1} = binP2;
    end
end