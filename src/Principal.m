function Prin=Principal(viloes)
%--------------------------------------------------------------------------
% MO810 - Projeto
% Algoritmo Gen�tico
% Team Formation
%--------------------------------------------------------------------------

% Numero de individuos da popula�ao

n = length(viloes);
dataFolder = '../data/';

NumPop = 71; % Tamanho da popula��o (deve ser impar pois a primeira posi��o corresponde a elite)
NumGenes = n; % Numero de vil�es

% Inicializa�ao da Popula�ao
% Gene zero significa a ausen�ncia de um her�i
P = randi([0 381], NumPop, NumGenes);

% Chama a fun�ao de avalia�ao
F = Avaliacao(P, viloes, NumPop, NumGenes);

% Chama a fun�ao de selecao
NovaP= Selecao(P,F, NumPop,NumGenes, 381);
t= 1;
N=12;

melhorIndividuo = 0;
while(t <= 150)
     retornoReproducao = Reproducao(NovaP, 7, NumPop, NumGenes);
     retornoVariacao = Variacao(retornoReproducao, 0.03, NumPop, NumGenes, 381);
     retornoAvaliacao = Avaliacao(retornoVariacao, viloes, NumPop, NumGenes);
     NovaP= Selecao(retornoVariacao,retornoAvaliacao,NumPop,NumGenes,381);
     %Calculo da media do fitness da populacao
     mediaFitness(t)=mean(retornoAvaliacao);
     melhorIndividuo = max(retornoAvaliacao);
     melhorIndividuo_1(t) = max(retornoAvaliacao);
     t = t + 1;
end

 % figure(1); plot(mediahamming, 'r-'); hold on;

 hold on;
 figure(2); plot(mediaFitness, 'r--'); hold on;
 plot(melhorIndividuo_1);

% Escreve os resultados pra cada execu�ao

























