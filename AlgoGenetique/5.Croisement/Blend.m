%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Blend Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = Blend(GAParameters, MP)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
pc = GAParameters.Pc;
Enfants = [];
alpha = 0.5;

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:N
    
    %Sélection des couples de parents 
    P1 = MP(i,1:2);
    if(i < N)
        P2 = MP(i+1,1:2);
    else
        P2 = P1;
    end
    
    %Crossover avec probabilité de croisement pc
    if(rand < pc)
        
        %Parcours des couples de gènes
        for j = 1:2
            
            %Calcul des bornes
            a = P1(1,j)-alpha*(P2(1,j)-P1(1,j));
            b = P2(1,j)+alpha*(P2(1,j)-P1(1,j));
            
            %Si gene parent 1 < gene parent 2
            if(P1(1,j) < P2(1,j))
                r = (b-a)*rand + a;
            else
                r = (a-b)*rand + b;
            end
            
            %On assigne à l'enfant la valeur rand entre a et b
            E1(1,j) = r;
        end
    else
        E1 = P1;
    end
    
    %On retourne les enfants
    Enfants = [Enfants; E1; E1];
end