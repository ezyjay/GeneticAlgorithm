%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de sélection
%
%       Sélectionne les 'meilleurs' individus
%       et les mets dans le mating pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = Selection(UserInput,P,GAParameters)

switch (UserInput.Selection)
    %RWS
    case 1
        MP = RWS(P,GAParameters);
    %Kill tournament
    case 2
        MP = KillTournament(UserInput.Probleme,P,GAParameters);
    %SUS
    case 3
        MP = SUS(P,GAParameters,UserInput.Classement);
end