function R=Variacao(NovaP, pm, NumPop, NumGenes, maxValue)

for i=1:NumPop
    for j=1:NumGenes
        sort = rand;
        if (sort <= pm)
        	NovaP(i,j) = randi(maxValue);
        end
    end
end

R = NovaP;