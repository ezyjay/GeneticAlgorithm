%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classement Lineaire 2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pi, P] = ClassementLineaire2(N,P)

%r et q, paramètres de contrôle
r = 0.01;
q = r*(N-1)/2 + 1/N;

%Meilleur individu = rang N, pire = rang 0
rang = sort(P(:,3),1);
P = sortrows(P,3);

%Parcours de la population
for i = 1:N
    
    pi(i,1) = q - r*(i-1);
    
end