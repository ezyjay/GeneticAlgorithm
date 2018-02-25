%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classement
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pi, P] = Classement(choix_classement,N,P)


switch (choix_classement)
    
    %Classement linéaire 1
    case 1
        [pi, P] = ClassementLineaire1(N,P);
        
    %Classement linéaire 2
    case 2
        [pi, P] = ClassementLineaire2(N,P);

    %Classement Non linéaire
    case 3
        [pi, P] = ClassementNonLineaire(N,P);
end