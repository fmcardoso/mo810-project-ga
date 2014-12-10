function Prin=Principal(viloes)
%-------------------------------------------------------------------------- 
% MO810 - Projeto
% Algoritmo Gen�tico
% Team Formation 
%--------------------------------------------------------------------------

%Numero de individuos da popula�ao

[m,n] = size(viloes);
dataFolder = '../data/';

NumPop= 9; % Tamanho da popula��o, deve ser impar pois a primeira posi��o corresponde a elite
NumGenes=n; % Numero de vil�es


% Indice dos herois
chars = csvread(strcat(dataFolder, 'marvel_character.csv'));

% Inicializa�ao da Popula�ao
% Gene zero significa a ausen�ncia de um her�i
P = randi([0 chars(end)], NumPop,NumGenes);

%chama a fun�ao de avalia�ao
F=Avaliacao(P, viloes, NumPop, NumGenes);

%chama a fun�ao de selecao
NovaP= Selecao(P,F, NumPop,NumGenes, chars(end));
t= 1;
N=12;

melhorIndividuo = 0;
while(t <= 180)
    retornoReproducao = Reproducao(NovaP, 0.5, NumPop, NumGenes);
    retornoVariacao = Variacao(retornoReproducao, 0.02, NumPop, NumGenes); 
    teste = hamming(retornoVariacao, NumPop);
    retornoAvaliacao = Avaliacao(retornoVariacao,NumPop);
    NovaP= Selecao(retornoVariacao,retornoAvaliacao,NumPop,NumGenes);
    
      

    %Calculo da media do fitness da populacao
    mediaFitness(t)=mean(retornoAvaliacao);
    mediahamming(t)= mean(teste);
    
    melhorIndividuo = max(retornoAvaliacao);
    melhorIndividuo_1(t) = max(retornoAvaliacao);
    hammingMelhorIndividuo(t)=min(teste);
    
      
    t= t+1;
    
end
 
 figure(1); plot(mediahamming, 'r-'); hold on;
    plot(hammingMelhorIndividuo); 
    
    hold on;
    
    figure(2); plot(mediaFitness, 'r--'); hold on;
    plot(melhorIndividuo_1);
 

 
 

    





















