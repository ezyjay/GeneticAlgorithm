%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Boundary Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Boundary(GAParameters, ProblemParameters, Enfants)

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
            if(rand <= 0.5)
                 M(i,j) = L(1,j);
            elseif(rand > 0.5)
                 M(i,j) = U(1,j);
            end
        end
   end
    
    Mutants = [Mutants;  M(i,1:2)];
end
