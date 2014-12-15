function X=Cooperacao(lista, herois)

% Calcula o valor de cooperacao em um grupo de herois
X = 0;

for i = 1:length(herois)
  for j = i+1:length(herois)
  	if herois(i) > 0 && herois(j) > 0
	  	X += lista(herois(i), herois(j));
	end
  endfor
endfor