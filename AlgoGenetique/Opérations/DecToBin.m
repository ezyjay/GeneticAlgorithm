%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Passer une valeur décimale en binaire
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [PopulationInBinary] = DecToBin(PopulationInDecimal,GAParameters, ProblemParameters)

%Init variables
StepForDivision = (ProblemParameters.UpperLimit-ProblemParameters.LowerLimit)/(2^GAParameters.NbGenes);
PopulationInBinary = cell(GAParameters.PopSize,1);

%Matrice P contenant les 2 premières colonnes de 'PopulationInDecimal' (car valFitness pas utile ici)
P = [PopulationInDecimal(1:GAParameters.PopSize,1) PopulationInDecimal(1:GAParameters.PopSize,2)];

%Parcours de la population
for i = 1:1:GAParameters.PopSize
    
    PopulationInBinary{i,1} = de2bi(round((P(i,1:GAParameters.NumberOfChromosomes)-ProblemParameters.LowerLimit)./StepForDivision),GAParameters.NbGenes);
end