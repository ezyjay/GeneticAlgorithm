%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de croisement
%
%       Génère des enfants des individus 
%        par le biais d'opérations de croisement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = Croisement(idCroisement,GAParameters, MP, ProblemParameters)

switch (idCroisement)
    case 1
        %single-point crossover
        MPbinary = DecToBin(MP,GAParameters, ProblemParameters);
        Enfants = SinglePoint(GAParameters, MPbinary);
    case 2
        %multi-point crossover
        MPbinary = DecToBin(MP,GAParameters, ProblemParameters);
        Enfants = MultiPoint(GAParameters, MPbinary);
    case 3
        %uniform crossover
        MPbinary = DecToBin(MP,GAParameters, ProblemParameters);
        Enfants = UniformC(GAParameters, MPbinary);
    case 4
        %whole arithmetic crossover 
        Enfants = WholeArithmetic(GAParameters, MP);
    case 5
        %local arithmetic crossover 
        Enfants = LocalArithmetic(GAParameters, MP);
    case 6 
        %blend crossover
        Enfants = Blend(GAParameters, MP);
    case 7
        %simulated binary crossover
        Enfants = SimulatedBinary(GAParameters, MP);
    case 8
        %three parent (crossover issu de la littérature)
        MPbinary = DecToBin(MP,GAParameters, ProblemParameters);
        Enfants = ThreeParent(GAParameters, MPbinary);
end