function F=Avaliacao(P, viloes, NumPop, NumGenes, charsAtt, shared)
%--------------------------------------------------------------------------
%% Função de Fitness:
%% Calcula asoma o peso da arestas entre os todos os pares de heróis e entre os todos os pares heroi/vilão
%--------------------------------------------------------------------------

% Avaliaçao da populaçao
% Soluções viaveis são positivas
for i = 1:NumPop
   V(i) = Viabilidade(P(i,:), viloes, false, charsAtt);
end

% Calcula a função objetivo para cada time
for i = 1:NumPop
   Fitness(i) = (Cooperacao(shared, P(i,:)) + Experiencia(shared, P(i,:), viloes)) * V(i);
end

F = Fitness;