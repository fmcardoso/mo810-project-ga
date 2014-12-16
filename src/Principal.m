function Prin=Principal(viloes, arquivo, budget, outputFileName)
%--------------------------------------------------------------------------
% MO810 - Projeto
% Algoritmo Genético
% Team Formation
%--------------------------------------------------------------------------

% Numero de individuos da populaçao
  tic();
n = length(viloes);
dataFolder = '../data/';

% Carrega as habilidades dos personagens
charsAtt = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));

% Carrega valores do grafo
shared = MatrizRelacoes(strcat(dataFolder, 'shared_comic_books.csv'));

NumPop = (20 * n) + 1; % Tamanho da população (deve ser impar pois a primeira posição corresponde a elite)
NumGenes = n; % Numero de vilões

% Calcula o budget
if budget
  budgetMax = max(Budget1(charsAtt,viloes), Budget2(charsAtt,viloes));
else
  budgetMax = false;
end

% Inicializaçao da Populaçao
% Gene zero significa a ausenência de um herói
P = randi([0 381], NumPop, NumGenes);

% Chama a funçao de avaliaçao
F = Avaliacao(P, viloes, NumPop, NumGenes, charsAtt, shared, budgetMax);

% Chama a funçao de selecao
NovaP= Selecao(P,F, NumPop,NumGenes, 381);
t= 1;

melhorSolucao = zeros(1, NumGenes);
melhorIndividuo = 0;
plato = 0;

% Iteracoes do algoritmo genetico
while(t <= 300 && plato < 100)
     retornoReproducao = Reproducao(NovaP, 7, NumPop, NumGenes, viloes, shared);
     % Aumento na probalidade da variacao porque agora ela considera todo o cromossomo
     retornoVariacao = Variacao(retornoReproducao, 0.6, NumPop, NumGenes, charsAtt, budget);
     retornoAvaliacao = Avaliacao(retornoVariacao, viloes, NumPop, NumGenes, charsAtt, shared, budgetMax);
     NovaP= Selecao(retornoVariacao,retornoAvaliacao,NumPop,NumGenes,381);
     %Calculo da media do fitness da populacao
     mediaFitness(t)=mean(retornoAvaliacao);
     [maxRetorno, maxIndex] = max(retornoAvaliacao);
     if (melhorIndividuo < maxRetorno)
     	plato = 0;
     	melhorIndividuo = maxRetorno;
     	melhorSolucao = retornoVariacao(maxIndex, :);
     else
     	plato++;
     end
     melhorIndividuo_1(t) = maxRetorno;
     t = t + 1;
end

% Plota os graficos - Descomentar para a impressao.
 %figure(1); plot(melhorIndividuo_1, 'r--'); hold on;

 %figure(2); plot(mediaFitness, 'r--'); hold on;


% Escreve os resultados pra cada execuçao - Descomentar para impressao na tela	
% disp(strcat('Time Vilões: ',  arquivo))
% melhorSolucao
% melhorIndividuo

% Calcula o budget do grupo de herois
HTCost = 0;
budgetMax = Inf;                                % HTCost
for h = 1:length(melhorSolucao)
  % Powergrid medio do heroi
  pgm = mean(Atributos(charsAtt, melhorSolucao(h)));
  % Popularidade do heroi
  pop = Popularidade(charsAtt, melhorSolucao(h));
  % HTCost
  HTCost = HTCost + pgm * pop;
endfor

% Escreve o valor da execucao no arquivo
fileID = fopen(outputFileName,'at');
fprintf(fileID,strcat('\nTime viloes: ',  arquivo));
fprintf(fileID,'\nValor: %.0f    Tempo: %f\n', melhorIndividuo, toc());
fprintf(fileID,'Colaboration: %.0f    F. Xp: %.f\n', Cooperacao(shared, melhorSolucao), Experiencia(shared, melhorSolucao, viloes));
fprintf(fileID,'Budget: %.3f\n', HTCost);
fprintf(fileID,strrep(['Herois: (' sprintf(' %d,', melhorSolucao) ')'], ',)', ')\n'));
fclose(fileID);

  toc()























