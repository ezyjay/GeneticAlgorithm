%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Algorithme génétique
%      
%       Fait appel aux différentes étapes
%       de l'algorithme génétique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = GA(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
Gmax = GAParameters.Gmax;
Generations = [];

%-----------------------------------------
%   Initialisation
%-----------------------------------------
Po = Initialisation(ProblemParameters,GAParameters);
G = 1;

%-----------------------------------------
%   Evaluation de Po
%-----------------------------------------
P = Evaluation(UserInput,GAParameters,Po);

%-----------------------------------------
%   1er test du critère d'arrêt
%-----------------------------------------
critereArret = CritereArret(UserInput.CritereArret,G,Gmax,P,Generations);

%-----------------------------------------
% Boucle de génération des populations
%-----------------------------------------
while (critereArret == true)
    
    %-----------------------------------------
    %   Sélection
    %-----------------------------------------
    MP = Selection(UserInput,P,GAParameters);
    
    %-----------------------------------------
    %   Croisement
    %-----------------------------------------
    Enfants = Croisement(UserInput.Croisement,GAParameters, MP,ProblemParameters);
    
    %-----------------------------------------
    %   Mutation
    %-----------------------------------------
    Mutants = Mutation(UserInput.Mutation,GAParameters,ProblemParameters,Enfants,G);
    
    %-----------------------------------------
    %   Opérateur de variation pour faisabilité
    %-----------------------------------------
    P = OperateurVariation(UserInput.OperateurVariation,GAParameters,ProblemParameters,Mutants);
    
    %-----------------------------------------
    %   Evaluation
    %-----------------------------------------
    P = Evaluation(UserInput,GAParameters,P);

    %-----------------------------------------
    %   Remplacement
    %-----------------------------------------
    if UserInput.Remplacement == true
         P = Remplacement(UserInput.Probleme,GAParameters,ProblemParameters,P,MP);
    end

    %-----------------------------------------
    %   Sauvegarde de la génération
    %-----------------------------------------
    Generations{G,1} = P;
    
    %-----------------------------------------
    %   Test du critère d'arrêt
    %-----------------------------------------
    critereArret = CritereArret(UserInput.CritereArret,G,Gmax,P,Generations);
    
    %Génération suivante
    G = G + 1;
end

%Sauvegarde de la génération dans un fichier
save('generation_data.mat','Generations');
Gmax = G;

%-----------------------------------------
%   Résultats
%-----------------------------------------
Resultats(Generations,GAParameters,ProblemParameters,UserInput.Probleme);