function F=Avaliacao(P, viloes, NumPop, NumGenes)


% Avalia�ao da popula�ao
for i = 1:NumPop
    Viabilidade(P(i,:), viloes, NumGenes)
end

%vetor que armazena o fitness
% Ele � dado pela diferen�a entre 12 e a distancia de hamming
for i = 1:NumPop
    Fitness(i) = 12-H(i);
end

F = Fitness;