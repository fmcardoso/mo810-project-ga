%Sele�ao
%Foi usado roleta russa
function S= Selecao(P,F,NumPop, NumGenes) 

TotalFitness= sum(F);

for i= 1:NumPop
 GrausRoleta(i)= F(i)*360/TotalFitness;
end

%calculo da probabilidade
%Determinando os intervalos da roleta

for i= 1:NumPop
 Prob(i)= GrausRoleta(i)/sum(GrausRoleta);
end

%Verifica se existe numero com erro.
%Se existir ele seta para zero

for i=1:NumPop
    if isnan(Prob(i))
        Prob(i)=0;
    end
end

%Inicio do calculo dos intervalos
Intervalo(1)=Prob(1);
for i=2:NumPop
    Intervalo(i)=Intervalo(i-1)+Prob(i);
end

%Caso nao esteja somando 1, ele joga para 1
for i=1:NumPop
    Intervalo(i)=Intervalo(i)/Intervalo(NumPop);
end

%Sorteio para montar a pr�xima popula�ao
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

S = NovaP;