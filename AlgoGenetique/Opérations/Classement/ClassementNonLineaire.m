%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classement Non Lineaire
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pi, P] = ClassementNonLineaire(N,P)

%Paramètre de contrôle
a = 0.5;

%Meilleur individu = rang N, pire = rang 0
rang = sort(P(:,3),1);
P = sortrows(P,3);

%Parcours de la population
for i = 1:N
    
    pi(i,1) = power( a*(1-a) , N-i );
    
end