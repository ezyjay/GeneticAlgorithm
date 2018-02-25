%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Uniform Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Uniform(GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
pm = GAParameters.Pm;

Mutants = [];
M = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
   
   %Parcours des chromosomes
   for j = 1:GAParameters.NumberOfChromosomes
   
        if(rand < pm) 
            randMutation = (U-L)*rand + L;
            M(i,j) = randMutation(1,j);
        end
   end
   
   Mutants = [Mutants;  M(i,1:2)];
end
