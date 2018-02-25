%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de mutation
%
%       Génère des mutants 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Mutation(idMutation,GAParameters,ProblemParameters,Enfants,G)

switch (idMutation)
    case 1
        %bit-flip mutation 
        MutantsBin = BitFlip(GAParameters, Enfants);
        Mutants = BinToDec(MutantsBin,GAParameters, ProblemParameters);
    case 2
        %uniform mutation 
        Mutants = Uniform(GAParameters,ProblemParameters, Enfants);
    case 3
        %boundary mutation
        Mutants = Boundary(GAParameters,ProblemParameters, Enfants);
    case 4
        %nonuniform mutation
        Mutants = NonUniform(GAParameters,ProblemParameters, Enfants, G);
    case 5
        %normal mutation
        Mutants = Normal(GAParameters,ProblemParameters, Enfants);
    case 6 
        %polynomial mutation
        Mutants = Polynomial(GAParameters,ProblemParameters, Enfants);
end