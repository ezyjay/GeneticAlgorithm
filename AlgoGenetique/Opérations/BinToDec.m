%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Passer une fonction binaire en décimale
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [PopulationInDecimal] = BinToDec(PopulationInBinary,GAParameters,ProblemParameters)

%Init variables
StepForDivision = (ProblemParameters.UpperLimit-ProblemParameters.LowerLimit)/(2^GAParameters.NbGenes);
C = GAParameters.NumberOfChromosomes;
N = GAParameters.PopSize;
PopulationInDecimal = zeros(N,C);
convertedBin = zeros(1,C);

%Parcours de la population
for i = 1:N
    
    for j = 1:C
        convertedBin(1,j) = bi2de(PopulationInBinary{i}(j,:));   
    end
    
    PopulationInDecimal(i,1:C) = (convertedBin(1,1:C)-ProblemParameters.LowerLimit).*StepForDivision;
end