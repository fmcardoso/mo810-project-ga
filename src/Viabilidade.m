function X=Viabilidade(herois, viloes, NumGenes)

dataFolder = '../data/';

% Carrega as abilidades dos personagens
v = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));
v(:, 7) = [];

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

viavel = true;
for i = 1:6
	if scoreH(i) * NumGenes < scoreV(i) * numHerois
		viavel = false;
		break
	end
end

% Retorna 1 caso o time de herois seja mais forte que o de viloes
X = viavel;