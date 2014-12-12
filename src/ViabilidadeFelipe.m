function X=ViabilidadeFelipe(herois, viloes)

dataFolder = '../data/';

% Carrega as habilidades dos personagens
v = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));
v(:, 7) = [];

[t,NumGenes] = size(viloes);

% Matriz com o PowerGrid dos herois e vilões
heroesP = zeros(NumGenes, 6);
viloesP = zeros(NumGenes, 6);

% Obtem os atributos dos herois
j = 0;
for i = 1:NumGenes
	if herois(i) > 0
		j = j +1;
		heroesP(j,:) = v(herois(i),:);
	end
end

numHerois = j;

% Obtem os atributos dos viloes
j = 0;
for i = 1:NumGenes
	if viloes(i) > 0
		j = j +1;
		viloesP(j,:) = v(viloes(i),:);
	end
end

% Verifica viabilidade de cada abilidade
scoreH = sum(heroesP);
scoreV = sum(viloesP);

viavel = 1;

for i = 1:6
	if scoreH(i) * NumGenes < scoreV(i) * numHerois
		viavel = -1;
		break
	end
end

% Caso a solução seja viável o valor é positivo, se não o valor será negativo.
X = viavel;