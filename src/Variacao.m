function R=Variacao(NovaP, pm, NumPop, NumGenes, max)




flag1 = 1;
for i=2:NumPop
    for j=1:NumGenes       
        
        
        sort = rand;
        if (sort <= pm)
        	while flag1 == 1
                valor = randi([0 381]);
                flag1 = 0;
                for t = 1:NumGenes
                    if NovaP(i,t) == valor;
                        flag1 = 1;
                    end
                end
            end
           NovaP(i,j) = valor;
           flag1 = 1;
        end
        
    end
end

R = NovaP