function X=Viabilidade(herois, viloes)

dataFolder = '../data/';

% Carrega as habilidades dos personagens
L = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));

% Carrega powergrid dos herois e viloes
H = L(herois(herois>0), 1:6);
V = L(viloes, 1:6);

% Soma powergrid dos herois e viloes
scoreH = sum(H);
scoreV = sum(V);


% Compara media usando apenas inteiros
if sum(scoreH * nnz(V) > scoreV * nnz(H))
  X = 1;
else
  X = -1;
endif