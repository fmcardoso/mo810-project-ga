%Seleçao
%Foi usado roleta russa
function S= Selecao(P,F,NumPop, NumGenes, maxValue) 

% Verifica o numero de soluções viaveis, e as marca
numViavel=0;
sumViavel=0;
eliteV = 0;
elite = 0;
for i=1:NumPop
    if F(i) > 0
        numViavel = numViavel + 1;
        sumViavel += F(i);
        FS(i) = F(i);

        % Elitismo - Armazena a melhor solução
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
% Seu valor é inversamente proporcional ao numero de individuos
% viaveis na popoluação 
for i=1:NumPop
    if FS(i) < 0
        FS(i) = abs(F(i))/(sumViavel/(numViavel + 1) + 1);
    end
end

TotalFitness= sum(FS);

for i= 1:NumPop
    GrausRoleta(i)= FS(i)*360/TotalFitness;
end

%calculo da probabilidade
%Determinando os intervalos da roleta

for i= 1:NumPop
 Prob(i)= GrausRoleta(i)/sum(GrausRoleta);
end

% TODO - Codigo comentado, é realmente necessario?
%Verifica se existe numero com erro.
%Se existir ele seta para zero
%for i=1:NumPop
%    if isnan(Prob(i))
%        Prob(i)=0;
%    end
%end

%Inicio do calculo dos intervalos
Intervalo(1)=Prob(1);
for i=2:NumPop
    Intervalo(i)=Intervalo(i-1)+Prob(i);
end

%Caso nao esteja somando 1, ele joga para 1
for i=1:NumPop
    Intervalo(i)=Intervalo(i)/Intervalo(NumPop);
end


%Sorteio para montar a próxima populaçao
for j = 1:NumPop
    rand_num=rand(1);
    if rand_num<=Intervalo(1)
        individuo=1;
    end
    for i=2:NumPop
        if (rand_num<=Intervalo(i)) && (rand_num>Intervalo(i-1))
            individuo=i;
        end
    end
    for n = 1:NumGenes
        NovaP(j,n)= P(individuo,n);
    end
end

% Elitismo - Preenche com a melhor solução valida,
% caso não haja nenhuma utiliza um cromossomo aleatorio
if elite > 0
    NovaP(1,:) = P(elite,:);
else
    NovaP(1,:) = randi([0 maxValue], 1,NumGenes);
end

S = NovaP;