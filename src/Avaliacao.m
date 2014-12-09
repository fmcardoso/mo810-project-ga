function F=Avaliacao(P, viloes, NumPop, NumGenes)


% Avaliaçao da populaçao
% Soluções viaveis são positivas
for i = 1:NumPop
   Fitness(i) = Viabilidade(P(i,:), viloes, NumGenes)
end

F = Fitness;