function F=Avaliacao(P, viloes, NumPop)
%--------------------------------------------------------------------------
%% Função de Fitness:
%% Calcula asoma o peso da arestas entre os todos os pares de heróis e entre os todos os pares heroi/vilão
%--------------------------------------------------------------------------

dataFolder = '../data/';

% Carrega valores do grafo
shared = MatrizRelacoes(strcat(dataFolder, 'shared_comic_books.csv'));

% Avaliaçao da populaçao
% Soluções viaveis são positivas
for i = 1:NumPop
   V(i) = Viabilidade(P(i,:), viloes);
end

% Calcula a função objetivo para cada time
for i = 1:NumPop
   Fitness(i) = (Cooperacao(shared, P(i,:)) + Experiencia(shared, P(i,:), viloes)) * V(i);
end

F = Fitness;