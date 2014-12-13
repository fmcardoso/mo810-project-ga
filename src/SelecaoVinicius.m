%Seleçao
%Foi usado roleta russa
function S= Selecao(P,F,NumPop, NumGenes, maxValue)

% Verifica o numero de solucoes viaveis
numViavel = nnz(F>0);

% Verifica o fitness total viavel
sumViavel = sum(F(F>0));

% Obtem valor da melhor solucao, indice da melhor solucao e powergrid da melhor solucao
[valueElite, idxElite] = max(F);
powerElite = P(idxElite,:);

% Calcula peso das probabilidades
weightF = F;
weightF(F<=0) = abs(F(F<=0)/(numViavel + 1));

% Calcula o total dos pesos
totalF = sum(weightF);

% Calcula probabilidade de cada fitness
probF = weightF./totalF;

% Sorteio para montar a próxima populaçao
[x, R] = histc(rand(1,NumPop), cumsum([0; weightF./totalF]));
S = P(R,:);

% Elitismo - Preenche com a melhor solução valida,
% caso não haja nenhuma utiliza um cromossomo aleatorio
if idxElite > 0
    S(1,:) = P(idxElite,:);
else
    S(1,:) = round(rand(1, NumGenes)*maxValue);
end