%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Simulated Binary Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = SimulatedBinary(GAParameters, MP)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
l = GAParameters.NbGenes;
pc = GAParameters.Pc;
Enfants = [];

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
    
    %Beta i
    ui = rand;
    if(ui <= 0.5)
        Bi = power(2*ui,1/1+l);
    elseif(ui > 0.5)
        Bi = power(2*(1-ui),-(1+1/l));
    end
       
    %Crossover avec probabilité de croisement pc
    if(rand < pc)
        E1(1,1) = 0.5*(P1(1,1)+P2(1,1)) + 0.5*Bi*(P1(1,1)-P2(1,1));
        E1(1,2) = 0.5*(P1(1,2)+P2(1,2)) + 0.5*Bi*(P2(1,2)-P1(1,2));
    else
        E1 = P1;
    end
    
    %On retourne les enfants
    Enfants = [Enfants; E1; E1];
end