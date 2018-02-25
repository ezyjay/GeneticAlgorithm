%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classement Lineaire 1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pi, P] = ClassementLineaire1(N,P)

%a et b choisis tels que a+b=2
a = 0.8;
b = 1.2;

%Meilleur individu = rang 0, pire = rang N-1
rang = sort(P(:,3),1, 'descend');
P = sortrows(P,-3);

%Parcours de la population
for i = 1:N
    
    pi(i,1) = (a + i*(b-a)/(N-1)) / N;

end