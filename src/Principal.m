function Prin=Principal(viloes, arquivo, budget, outputFileName)
%--------------------------------------------------------------------------
% MO810 - Projeto
% Algoritmo Gen�tico
% Team Formation
%--------------------------------------------------------------------------

% Numero de individuos da popula�ao
  tic();
n = length(viloes);
dataFolder = '../data/';

% Carrega as habilidades dos personagens
charsAtt = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));

% Carrega valores do grafo
shared = MatrizRelacoes(strcat(dataFolder, 'shared_comic_books.csv'));

% Todos 
todosChars = [1:381];

for i=1:length(todosChars)
  popL(i) = charsAtt(i,7);  
  pwgL(i) = sum(Atributos(charsAtt, i));
end

NumPop = (30 *  n) + 1; % Tamanho da popula��o (deve ser impar pois a primeira posi��o corresponde a elite)
NumGenes = n; % Numero de vil�es

% Calcula o budget
if budget
  [up1, down1]  = Budget1(charsAtt,viloes);
  [up2, down2]  = Budget2(charsAtt,viloes);
  
  B(1,: ) = [up1, down1];
  B(2,: ) = [up2, down2];

  budgetMax = B;
else
  budgetMax = false;
end

% Inicializa�ao da Popula�ao
% Gene zero significa a ausen�ncia de um her�i
P = randi([0 381], NumPop, NumGenes);

% Chama a fun�ao de avalia�ao
F = Avaliacao(P, viloes, NumPop, NumGenes, charsAtt, shared, budget, budgetMax);

% Chama a fun�ao de selecao
NovaP= Selecao(P,F, NumPop,NumGenes, 381);
t= 1;

melhorSolucao = zeros(1, NumGenes);
melhorIndividuo = 0;
plato = 0;

% Iteracoes do algoritmo genetico
while(t <= 300 && plato < 50)
     retornoReproducao = Reproducao(NovaP, 7, NumPop, NumGenes, viloes, shared, charsAtt, budget);
     % Aumento na probalidade da variacao porque agora ela considera todo o cromossomo
     retornoVariacao = Variacao(retornoReproducao, 0.6, NumPop, NumGenes, charsAtt, budget, pwgL);
     retornoAvaliacao = Avaliacao(retornoVariacao, viloes, NumPop, NumGenes, charsAtt, shared, budget, budgetMax);
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


% Escreve os resultados pra cada execu�ao - Descomentar para impressao na tela	
% disp(strcat('Time Vil�es: ',  arquivo))
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