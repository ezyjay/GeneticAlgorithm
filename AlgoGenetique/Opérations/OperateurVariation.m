%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Opérateurs de variation pour assurer la faisabilité de la solution
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = OperateurVariation(choix_operateur,GAParameters,ProblemParameters,P)

%Init variables
N = GAParameters.PopSize;
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;

switch (choix_operateur)
    %Simple : Assigner les bornes
    case 1
        
        for i = 1:N
            for j = 1:size(L,2)
                if P(i,j) < L(1,j)
                    P(i,j) = L(1,j);
                elseif P(i,j) > U(1,j)
                    P(i,j) = U(1,j);                    
                end
            end
        end
            
    %Assigner 2*borne-xi
    case 2
        
        for i = 1:N
            for j = 1:size(L,2)
                if P(i,j) < L(1,j)
                    P(i,j) = 2*L(1,j)-P(i,j);
                elseif P(i,j) > U(1,j)
                    P(i,j) = 2*U(1,j)-P(i,j);                    
                end
            end
        end
end
