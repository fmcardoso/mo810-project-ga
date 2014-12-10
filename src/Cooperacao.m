function X=Cooperacao(lista, herois)

% Calcula o valor de cooperacao em um grupo de herois
X = 0;

for i = 1:length(herois)
  for j = i+1:length(herois)
  	h1 = herois(i)
  	h2 = herois(j)
  	lista(h2, h2)
  	X += lista(herois(i), herois(j));
  endfor
endfor