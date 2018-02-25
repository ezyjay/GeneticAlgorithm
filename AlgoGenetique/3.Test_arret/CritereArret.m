%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   Critères d'arrêt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function critereArret = CritereArret(choixUser,G,Gmax,P,Generations)

switch (choixUser)
    
    %Critère : Num Génération courante doit être inférieure à Nb générations max
    case 1
        if(G <= Gmax)
            critereArret = true;
        else
            critereArret = false;
        end
        
    %Rapport des valeurs de fitness
    case 2
        r = min(P(:,3))/max(P(:,3));
        Seuil = 0.95;
        
        if(r <= Seuil)
            critereArret = true;
        else
            critereArret = false;
        end
   
    %Taux changement valeur de fitness
    case 3
        %Doit au moins faire 3 générations
        if (G > 3)
            %Fitness moyenne génération actuelle
            fitG1 = abs(mean(Generations{G,1}(:,3)));
            %Fitness moyenne génération -1
            fitG2 = abs(mean(Generations{(G-1),1}(:,3)));
            %Fitness moyenne génération -2
            fitG3 = abs(mean(Generations{(G-2),1}(:,3)));
            %Taux définissant les bornes d'acceptation du changemement de la valeur de fitness entre générations
            tauxFit = fitG1*0.1;

            %Si moyenne de fitness des générations précedentes proche de la valeur de fitness de la valeur actuelle, on s'arrête
            if((fitG2 > (fitG1-tauxFit) && fitG2 < (fitG1+tauxFit)) && (fitG3 > (fitG1-tauxFit) && fitG3 < (fitG1+tauxFit)))
                critereArret = false;
            else
                critereArret = true;
            end
        else
            critereArret = true;
        end
end