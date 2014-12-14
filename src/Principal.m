function Prin=Principal(viloes, arquivo)
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

NumPop = 81; % Tamanho da população (deve ser impar pois a primeira posição corresponde a elite)
NumGenes = n; % Numero de vilões

% Inicializaçao da Populaçao
% Gene zero significa a ausenência de um herói
P = randi([0 381], NumPop, NumGenes);

% Chama a funçao de avaliaçao
F = Avaliacao(P, viloes, NumPop, NumGenes, charsAtt, shared);

% Chama a funçao de selecao
NovaP= Selecao(P,F, NumPop,NumGenes, 381);
t= 1;

melhorSolucao = zeros(1, NumGenes);
melhorIndividuo = 0;
plato = 0;

while(t <= 150 && plato < 50)
     retornoReproducao = Reproducao(NovaP, 7, NumPop, NumGenes, viloes, shared);
     % Aumento na probalidade da variacao porque agora ela considera todo o cromossomo
     retornoVariacao = Variacao(retornoReproducao, 0.6, NumPop, NumGenes, charsAtt);
     retornoAvaliacao = Avaliacao(retornoVariacao, viloes, NumPop, NumGenes, charsAtt, shared);
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

% figure(1); plot(melhorIndividuo_1, 'r--'); hold on;

% figure(2); plot(mediaFitness, 'r--'); hold on;


% Escreve os resultados pra cada execuçao
%disp(strcat('Valor para execuçao: ',  arquivo))
%melhorSolucao
%  max(melhorIndividuo)

fileID = fopen('exp.txt','at');
fprintf(fileID,strcat('Time viloes: ',  arquivo));
fprintf(fileID,'\nValor: %.0f    Tempo: %f\n', melhorIndividuo, toc());
fprintf(fileID,'Colaboration: %.0f    F. Xp: %.f\n', Cooperacao(shared, melhorSolucao), Experiencia(shared, melhorSolucao, viloes));
fprintf(fileID,'Budget: %.3f\n', max(Budget1(charsAtt,melhorSolucao,viloes), Budget2(charsAtt,melhorSolucao,viloes)));
fprintf(fileID,strrep(['Herois: (' sprintf(' %d,', melhorSolucao) ')'], ',)', ')\n'));
fclose(fileID);

  toc()























