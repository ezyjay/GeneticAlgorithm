%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   TP1 - Métaheuristiques en optimisation
% 
%   Esmé James - JAME15539504
%   Wilfried Pouchous - POUW04069501
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------
%	Clear
%-----------------------------------------
clc;

%-----------------------------------------
%   Choix utilisateurs
%-----------------------------------------
%[UserInput, GAParameters] = GetUserInput();

%###########################################################################################################
%--ATTENTION : PAS DE TEST SUR LES VALEURS ENTREES ICI
UserInput.Probleme = 1; %1 = Rosenbrock, 2 = Griewank

GAParameters.PopSize = 100; %temp
GAParameters.NbGenes = 10; %temp
GAParameters.Gmax = 50; %temp
GAParameters.Pc = 0.8; %temp
GAParameters.Pm = 0.1; %temp
GAParameters.NbIndividusRemplacer = GAParameters.PopSize;  %temp
GAParameters.KPointCrossOver = 4;

UserInput.CritereArret = 1; %1 = Nb générations max, 2 = Rapport valeurs de fitness, 3 = %Taux changement valeur de fitness
UserInput.Selection = 1; %1 = RWS, 2 = Kill Tournament, 3 = SUS
UserInput.Classement = 1; %1 = Linéaire ((a+i*(b-a)/(N-1))/N), 2 = Linéaire (q-r*(i-1)), 3 = Non Linéaire
UserInput.ChgmtEchelle = 3; %1 = Linéaire, 2 = Troncature Sigma, 3 = Pas de changement échelle
UserInput.Croisement = 4; %1 = SinglePoint, 2 = MultiplePoint, 3 = Uniform, 4 = WholeArithmetic, 5 = LocalArithmetic, 6 = Blend, 7 = SimulatedBinary, 8 = Three Parent
UserInput.Mutation = 2; %1 = Bit-Flip, 2 = Uniform, 3 = Boundary, 4 = NonUniform, 5 = Normal, 6 = Polynomial
UserInput.OperateurVariation = 1; %1 = Assigne valeur borne à individu si hors des bornes, 2 = Assigne 2*valBorne-valIndividus à individu si hors des bornes
UserInput.Remplacement = true;
%###########################################################################################################


%-----------------------------------------
%   Ajout de chemins
%-----------------------------------------
addpath(genpath('Problemes'));
addpath(genpath('AlgoGenetique'));

%-----------------------------------------
%   Choix problème
%-----------------------------------------
switch (UserInput.Probleme)
    % 1 = Rosenbrock
    case 1
        ProblemParameters.UpperLimit = [2 3];
        ProblemParameters.LowerLimit = [0 0];
        ProblemParameters.step = 0.01;
        GAParameters.NumberOfChromosomes = 2;
    %2 = Griewank
    case 2
        ProblemParameters.UpperLimit = [30 30];
        ProblemParameters.LowerLimit = [-30 -30];
        ProblemParameters.step = 1;
        GAParameters.NumberOfChromosomes = 2;
end

%-----------------------------------------
%   Appel de l'algorithme génétique
%-----------------------------------------
GA(UserInput,ProblemParameters,GAParameters);

%-----------------------------------------
%   Suppression des chemins
%-----------------------------------------
rmpath('Problemes');
rmpath('AlgoGenetique');
