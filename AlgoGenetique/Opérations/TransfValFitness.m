%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Transfert de valeur de fitness
%
%   Permet de traiter problèmes de minimisation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function NewFi = TransfValFitness(Fitness,N)

%Init variables
fmax = max(Fitness);
NewFi = zeros(N,1);

%Parcours de la population
for i = 1:N
    
    NewFi(i,1) = fmax - Fitness(i,1);
    
end