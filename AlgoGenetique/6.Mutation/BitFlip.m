%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de mutation
%
%       BitFlip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MutantsBin = BitFlip(GAParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
pm = GAParameters.Pm;
l = GAParameters.NbGenes;
C = GAParameters.NumberOfChromosomes;

MutantsBin = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
    for j = 1:C
        for k = 1:l
            if(rand < pm)
                if(MutantsBin{i}(j,k) == 0)
                    MutantsBin{i}(j,k) = 1;
                else
                    MutantsBin{i}(j,k) = 0;
                end
            end
        end
    end
end