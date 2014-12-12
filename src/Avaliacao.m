function F=Avaliacao(P, viloes, NumPop)
%--------------------------------------------------------------------------
%% Fun��o de Fitness:
%% Calcula asoma o peso da arestas entre os todos os pares de her�is e entre os todos os pares heroi/vil�o
%--------------------------------------------------------------------------

dataFolder = '../data/';

% Carrega valores do grafo
shared = MatrizRelacoes(strcat(dataFolder, 'shared_comic_books.csv'));

% Avalia�ao da popula�ao
% Solu��es viaveis s�o positivas
for i = 1:NumPop
   V(i) = Viabilidade(P(i,:), viloes);
end

% Calcula a fun��o objetivo para cada time
for i = 1:NumPop
   Fitness(i) = (Cooperacao(shared, P(i,:)) + Experiencia(shared, P(i,:), viloes)) * V(i);
end

F = Fitness;