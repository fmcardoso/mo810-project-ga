function [up, down]=Budget2(lista, viloes)

% Todos os viloes
todosHerois = [1:381];
todosViloes = [382:767];

up = sum(Atributos(lista, viloes));
up = up * length(todosViloes);
up = up * sum(Atributos(lista, todosHerois));
up = up * sum(Popularidade(lista, todosHerois));

down = sum(Atributos(lista, todosViloes));
down = down * length(todosHerois) * length(todosHerois);
