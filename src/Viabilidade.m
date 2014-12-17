function X=Viabilidade(herois, viloes, budget, charsAtt)

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
budgetMax = Inf;
if(budget > 0)
	% HTCost
	for h = 1:length(herois)
		% Powergrid medio do heroi
		pgm = mean(Atributos(L, herois(h)));
		% Popularidade do heroi
		pop = Popularidade(L, herois(h));
		% HTCost
		HTCost = HTCost + pgm * pop;
		budgetMax = budget;
	endfor
endif

% Compara media usando apenas inteiros
% Verifica se há alguma posição onde os heróis não podem vences
if ((~any(scoreH * nnz(V) < scoreV * nnz(H))) && (HTCost < budgetMax) && nnz(H) > 1)
	X = 1;
else
	if (HTCost < budgetMax)
		X = -1;
	else
		X = -budgetMax/HTCost;
	end
endif