%Sele�ao usando roleta russa
function S= Selecao(P,F,NumPop, NumGenes, maxValue)

% Verifica o numero de solu��es viaveis, e as marca
numViavel = nnz(F>0);
sumViavel = sum(F(F>0));
FS = F;
FS(F<=0) = -1;

% Elitismo
[eliteV, elite] = max(F);
eliteT = P(elite,:);

% Calcula o fitness de individuos inviaveis.
% Seu valor � inversamente proporcional ao numero de individuos
% viaveis na popolua��o
FS(FS<0) = abs(F(FS<0)/((NumPop - numViavel+1)));
TotalFitness = sum(FS);

% Calculo da probabilidade
% Determinando os intervalos da roleta
Prob = FS/TotalFitness;

% Sorteio para montar a pr�xima popula�ao
[~,R] = histc(rand(1,NumPop),cumsum([0;FS(:)./sum(FS)]));
NovaP = P(R,:);

% Elitismo - Preenche com a melhor solu��o valida,
% caso n�o haja nenhuma utiliza um cromossomo aleatorio
if elite > 0
  NovaP(1,:) = P(elite,:);
else
  NovaP(1,:) = round(rand(1,NumGenes)*maxValue);
end

S = NovaP;