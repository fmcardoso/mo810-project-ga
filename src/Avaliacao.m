function F=Avaliacao(P, viloes, NumPop, NumGenes)


% Avalia�ao da popula�ao
% Solu��es viaveis s�o positivas
for i = 1:NumPop
   Fitness(i) = Viabilidade(P(i,:), viloes, NumGenes)
end

F = Fitness;