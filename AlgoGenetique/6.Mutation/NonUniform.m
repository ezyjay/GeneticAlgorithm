%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Non-Uniform Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = NonUniform(GAParameters, ProblemParameters, Enfants, G)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
Gmax = GAParameters.Gmax;
pm = GAParameters.Pm;
b = 2;

Mutants = [];
M = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
    
   %Parcours des chromosomes
   for j = 1:GAParameters.NumberOfChromosomes
       
        if(rand < pm) 
            if(rand >= 0.5)
                 M(i,j) = Enfants(i,j) + (U(1,j)-Enfants(i,j))*(1-power(rand,power((1-G)/Gmax,b)));
             elseif(rand < 0.5)
                 M(i,j) = Enfants(i,j) - (Enfants(i,j)-L(1,j))*(1-power(rand,power((1-G)/Gmax,b)));
            end
        end
   end
    
    Mutants = [Mutants;  M(i,1:2)];
end
