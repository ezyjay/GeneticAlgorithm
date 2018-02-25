%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Récupérer les données utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [UserInput, GAParameters] = GetUserInput()

disp('Algorithme génétique');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Choix problème
%-----------------------------------------
disp('I - Problème à traiter');
UserInput.Probleme = input('     1 = Rosenbrock, 2 = Griewank (valeurs négatives)\n     Votre choix : ');
%Test validité
if (UserInput.Probleme ~= 1 && UserInput.Probleme ~= 2)
    disp('     Choix non valide -> Problème 1 = Rosenbrock choisi par défaut');
    UserInput.Probleme = 1;
end

%-----------------------------------------
%   Paramètres généraux
%-----------------------------------------
disp('II - Paramètres généraux du problème');
GAParameters.PopSize = input('     Taille de population (N) : ');
GAParameters.NbGenes = input('     Nombre de gènes (> 10) : ');
%Test nombre de gènes (obligatoire car bugs si nombre de gènes trop petit)
if (GAParameters.NbGenes < 10)
    disp('     Choix non valide -> Nombre de gènes = 10 (par défaut)');
    GAParameters.NbGenes = 10;
end
GAParameters.Gmax = input('     Nombre de générations max (Gmax) : ');
GAParameters.Pc = input('     Probabilité de croisement Pc (entre 0 et 1) : ');
GAParameters.Pm = input('     Probabilité de mutation Pm (entre 0 et 1) : ');

%-----------------------------------------
%   Choix critère arrêt
%-----------------------------------------
disp('III - Choix du critère arrêt');
UserInput.CritereArret = input('     1 = Nb générations max, 2 = Rapports valeurs de fitness, 3 = Taux changement valeur de fitness\n     Votre choix : ');
%Test validité
if (UserInput.CritereArret ~= 1 && UserInput.CritereArret ~= 2 && UserInput.CritereArret ~= 3)
    disp('     Choix non valide -> Critère arrêt 1 = Gmax choisie par défaut');
    GAParameters.Gmax = input('     Nombre de générations max : ');
    UserInput.CritereArret = 1;
end

%-----------------------------------------
%   Choix sélection
%-----------------------------------------
disp('IV - Choix de la méthode de sélection');
UserInput.Selection = input('     1 = RWS, 2 = Kill Tournament, 3 = SUS\n     Votre choix : ');
%Eviter problème cas kill tournament
if (UserInput.Selection == 2)
    GAParameters.NbIndividusRemplacer = GAParameters.PopSize;
end
%Test validité
if (UserInput.Selection ~= 1 && UserInput.Selection ~= 2 && UserInput.Selection ~= 3)
    disp('     Choix non valide -> Sélection 1 = RWS choisie par défaut');
    UserInput.Selection = 1;
end

%-----------------------------------------
%   Choix Classement
%-----------------------------------------
if (UserInput.Selection == 3)
    disp('Choix de la méthode de classement pour SUS');
    UserInput.Classement = input('     1 = Linéaire ((a+i*(b-a)/(N-1))/N), 2 = Linéaire (q-r*(i-1)), 3 = Non Linéaire\n     Votre choix : ');
end

%-----------------------------------------
%   Choix Changement d'échelle
%-----------------------------------------
 disp('V - Choix du changement échelle');
 UserInput.ChgmtEchelle = input('     1 = Linéaire, 2 = Troncature Sigma, 3 = Pas de changement échelle\n     Votre choix : ');
 

%-----------------------------------------
%   Choix croisement
%-----------------------------------------
disp('VI - Choix de la méthode de croisement');
UserInput.Croisement = input('     1 = SinglePoint, 2 = MultiplePoint, 3 = Uniform, 4 = WholeArithmetic, 5 = LocalArithmetic, 6 = Blend, 7 = SimulatedBinary, 8 = ThreeParent\n     Votre choix : ');
%K-Point Crossover
if (UserInput.Croisement == 2)
    GAParameters.KPointCrossOver = input('     Nombre de points de croisement : ');
    if(GAParameters.KPointCrossOver < 2 || GAParameters.KPointCrossOver > GAParameters.NbGenes-1)
        disp('     Choix non valide -> Nombre de points = 4 par défaut');
        GAParameters.KPointCrossOver = 4;
    end
end
%Test validité
if (UserInput.Croisement ~= 1 && UserInput.Croisement ~= 2 && UserInput.Croisement ~= 3 && UserInput.Croisement ~= 4 && UserInput.Croisement ~= 5 && UserInput.Croisement ~= 6 && UserInput.Croisement ~= 7 && UserInput.Croisement ~= 8)
    disp('     Choix non valide -> Croisement 4 = WholeArithmetic choisi par défaut');
    UserInput.Croisement = 4;
end

%-----------------------------------------
%   Choix mutation
%-----------------------------------------
disp('VII - Choix de la méthode de mutation');
if (UserInput.Croisement == 1 || UserInput.Croisement == 2 || UserInput.Croisement == 3 || UserInput.Croisement == 8)
    disp('     Mutation 1 = Bit-Flip choisie par défaut');
    UserInput.Mutation = 1;
else
    UserInput.Mutation = input('     2 = Uniform, 3 = Boundary, 4 = NonUniform, 5 = Normal, 6 = Polynomial\n     Votre choix : ');
    %Test validité
    if (UserInput.Mutation ~= 2 && UserInput.Mutation ~= 3 && UserInput.Mutation ~= 4 && UserInput.Mutation ~= 5 && UserInput.Mutation ~= 6)
    disp('     Choix non valide -> Mutation 2 = Uniform choisie par défaut');
    UserInput.Mutation = 2;
    end
end

%-----------------------------------------
%   Choix operateur variation
%-----------------------------------------
disp('VIII - Opérateur de variation pour assurer la faisabilité');
UserInput.OperateurVariation = input('     1 = Assigne valeur borne à individu si hors des bornes, 2 = Assigne 2*valBorne-valIndividus à individu si hors des bornes\n     Votre choix : ');
%Test validité
if (UserInput.OperateurVariation ~= 1 && UserInput.OperateurVariation ~= 2)
    disp('     Choix non valide -> Opérateur Variation 2 choisi par défaut');
    UserInput.OperateurVariation = 1;
end
    
        
%-----------------------------------------
%   Choix remplacemement
%-----------------------------------------
disp('IX - Dérouler algorithme avec un remplacement ?');
choix = input('     1 = Oui, 2 = Non\n     Votre choix : ');
switch (choix)
    case 1
        UserInput.Remplacement = true;
        GAParameters.NbIndividusRemplacer = input('     Nb individus à remplacer : ');
    case 2
        UserInput.Remplacement = false;
    otherwise
        UserInput.Remplacement = false;
        disp('     Choix non valide -> Pas de remplacememnt par défaut');
end

disp('X - Lancement');
disp('------------------------------------------------------------');