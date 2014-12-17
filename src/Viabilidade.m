function X=Viabilidade(herois, viloes, budget, budgetMax, charsAtt)

% Carrega as habilidades dos personagens
L = charsAtt;

% Carrega powergrid dos herois e viloes
H = L(herois(herois>0), 1:6);
V = L(viloes, 1:6);

% Soma powergrid dos herois e viloes
scoreH = sum(H);
scoreV = sum(V);

% Com budget
HTCost = 0;
if(budget > 0)
	% HTCost
	for h = 1:length(herois)
		% Powergrid medio do heroi
		pgm = sum(Atributos(L, herois(h)));
		% Popularidade do heroi
		pop = Popularidade(L, herois(h));
		% HTCost
		HTCost = HTCost + pgm * pop;
	endfor
endif

if budget && ((HTCost * budgetMax(1,2)) > budgetMax(1, 1)) && ((HTCost * budgetMax(2,2)) > budgetMax(2, 1))
	X = -(budgetMax(1,1)/budgetMax(1,2))/HTCost;
elseif ((~any(scoreH * nnz(V) < scoreV * nnz(H))) && nnz(H) > 1)
	X = 1;
else
	X = -1;
end
