function F=Avaliacao(P, NumPop)

% Avalia�ao inicial da popula�ao
%Calculado a distancia de hamming entre os 

Objetivo= [0 1 0 0 1 0 0 1 0 0 1 0];
%vetor que armazena as distancia de hamming
for i = 1:NumPop
    T = Objetivo ~= P(i,:);
    H(i) = sum(T);
end

%vetor que armazena o fitness
% Ele � dado pela diferen�a entre 12 e a distancia de hamming
for i = 1:NumPop    
    Fitness(i) = 12-H(i);
end 

F = Fitness;