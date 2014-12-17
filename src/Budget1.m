function [up, down]=Budget1(lista, viloes)

% Todos os herois
 todosHerois = [1:381];

% % VTCost
VTCost = 0;
for v = 1:length(viloes)
  % Powergrid medio do vilao v
  pgm = sum(Atributos(lista, viloes(v)));
  % Popularidade do vilao v
  pop = Popularidade(lista, viloes(v));
  % VTCost
  VTCost = VTCost + pgm * pop;
endfor

up = sum(Atributos(lista, todosHerois));
up = up * sum(Popularidade(lista, todosHerois));
up = up * length(viloes) * length(viloes);
up = up * VTCost;

down = sum(Atributos(lista, viloes));
down = down * sum(Popularidade(lista, viloes));
down = down * length(todosHerois) * length(todosHerois);