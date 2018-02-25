%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Troncature Sigma
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Fitness = TroncatureSigma(P,N)


%-----------------------------------------
%   Init variables
%-----------------------------------------
fmoy = mean(P(:,3));
c = 3;
sigma = mean(std(P(:,1:2)));
Fitness = zeros(N,1);

%-----------------------------------------
%   PArcours de la population
%-----------------------------------------
for i = 1:N
    
    Fitness(i,1) = P(i,3) - (fmoy - c*sigma);
    
    if Fitness(i,1) < 0
        Fitness(i,1) = 0;
    end
end