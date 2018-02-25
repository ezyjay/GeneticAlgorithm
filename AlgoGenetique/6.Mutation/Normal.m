%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Normal Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Normal(GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
Gmax = GAParameters.Gmax;
pm = GAParameters.Pm;

Mutants = [];
LoiN = randn(1,2);
ecartType = std(LoiN);
M = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
    
   %Parcours des chromosomes
   for j = 1:GAParameters.NumberOfChromosomes
        if(rand < pm) 
            M(i,j) = Enfants(i,j) + ecartType*LoiN(1,j);
        end
   end
    
    Mutants = [Mutants;  M(i,1:2)];
end
