function X=Experiencia(lista, herois, viloes)

% Calcula experiencia de luta entre um grupo de herois e viloes
X = 0;
for i = 1:length(herois)
  for j = 1:length(viloes)
    X += lista(herois(i), viloes(j));
  endfor
endfor