%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Resultats
%
%       Permet l'affichage des résultats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Resultats(Generations,GAParameters,ProblemParameters,choix_prob)

%Init variables
N = GAParameters.PopSize;
Gmax = size(Generations,1);

%Récupération des bornes du problèmes
x = ProblemParameters.LowerLimit(1,1):ProblemParameters.step:ProblemParameters.UpperLimit(1,1);
y = ProblemParameters.LowerLimit(1,2):ProblemParameters.step:ProblemParameters.UpperLimit(1,2);

%Appel du problème
probleme = Probleme(choix_prob,x,y);
[X,Y] = meshgrid(x,y);

%Génération initiale
Po = Generations{1,1};
%Génération finale
Pf = Generations{Gmax,1};

%Params figure
figure('rend','painters','pos',[450 10 1000 600])

%On trace les points correspondant à la générations initiale et finale
for i = 1:N
    s1 = scatter3(Po(i,1),Po(i,2),Po(i,3),'filled','m'); %G initiale
    sf = scatter3(Pf(i,1),Pf(i,2),Pf(i,3),'b'); %G finale
    hold on
end

%Traçage de la courbe du problème
h = plot3(X,Y,probleme,':');
hold on

%Titres et légendes
title('Évolution de la population en fonction des générations');
xlabel('Chromosome x');
ylabel('Chromosome y');
zlabel('Valeur de fitness');
legend('Génération finale','1ère génération');
hold off