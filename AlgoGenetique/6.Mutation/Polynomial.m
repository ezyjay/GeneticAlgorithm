%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Polynomial Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Polynomial(GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
Gmax = GAParameters.Gmax;
pm = GAParameters.Pm;
n = 5;

Mutants = [];
M = Enfants;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:size(Enfants,1)
    
   %Parcours des chromosomes
   for j = 1:GAParameters.NumberOfChromosomes
        if(rand < pm)
             u = rand;
            if(u < 0.5)
                  deltaBar = power((2*u),(1/(n+1)))-1;
            elseif(u >= 0.5)
                  deltaBar = 1-power(2*(1-u),(1/n+1));
            end
            M(i,j) = Enfants(i,j) + (U(1,j)-L(1,j))*deltaBar;
        end
   end
   
   Mutants = [Mutants;  M(i,1:2)];
end
