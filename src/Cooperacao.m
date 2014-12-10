function X=Cooperacao(lista, herois)

% Calcula o valor de cooperacao em um grupo de herois
X = 0;
for i = 1:length(herois)
  for j = i+1:length(herois)
  	i
  	j
  	lista(herois(i), herois(j));
  	X += lista(herois(i), herois(j));
  endfor
endfor