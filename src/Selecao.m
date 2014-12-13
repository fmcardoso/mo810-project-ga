%Sele�ao
%Foi usado roleta russa
function S= Selecao(P,F,NumPop, NumGenes, maxValue)

% Verifica o numero de solu��es viaveis, e as marca
numViavel=0;
sumViavel=0;
eliteV = 0;
elite = 0;
for i=1:NumPop
    if F(i) > 0
        numViavel = numViavel + 1;
        sumViavel += F(i);
        FS(i) = F(i);

        % Elitismo - Armazena a melhor solu��o
        if F(i) > eliteV
            elite = i;
        end
    else
        FS(i) = -1;
    end
end

for i=1:NumPop
    if F(i) > eliteV
        eliteV = F(i);
        eliteT = P(i,:);
    end
end

% Calcula o fitness de individuos inviaveis.
% Seu valor � inversamente proporcional ao numero de individuos
% viaveis na popolua��o
for i=1:NumPop
    if FS(i) < 0
        FS(i) = abs(F(i)/((numViavel + 1)));
    end
end

TotalFitness= sum(FS);

%calculo da probabilidade
%Determinando os intervalos da roleta

for i= 1:NumPop
 Prob(i)= FS(i)/TotalFitness;;
end

%Sorteio para montar a pr�xima popula�ao
[x,R] = histc(rand(1,NumPop),cumsum([0;FS(:)./sum(FS)]));
NovaP = P(R,:);

% Elitismo - Preenche com a melhor solu��o valida,
% caso n�o haja nenhuma utiliza um cromossomo aleatorio
if elite > 0
    NovaP(1,:) = P(elite,:);
else
    %NovaP(1,:) = randi([0 maxValue], 1,NumGenes);
  NovaP(1,:) = round(rand(1,NumGenes)*maxValue);
end

S = NovaP;