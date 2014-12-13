function P=Reproducao(NovaP, pc, NumPop, NumGenes)

%function P=Reproducao(NovaP, pc, NumPop, NumGenes)


for t = 2:2:NumPop-1
    p1 = NovaP(t,:);
    p2 = NovaP(t+1,:);

    f1= zeros(1,NumGenes); 
    f2= zeros(1,NumGenes);
    
    pc = floor(0.4 * NumGenes);%randi([0 NumGenes]);
    
    for r = 1:pc
        f1(r) = p1(r);
        f2(r) = p2(r);
    end

    for teste = pc+1:NumGenes
    %teste se há elementos iguais nos cromossomos.
        flag1 = 0;
        flag2 = 0;
        for i = 1:NumGenes
            if p1(teste) == p2(i) && p1(teste) ~= 0
                flag1 = 1;
            end
        end
        
        for i = 1:NumGenes
             if p2(teste) == p1(i) && p2(teste) ~= 0
                  flag2 = 1;
             end
        end
        %se nao houver elementos iguais, faz-se a troca.
        if flag1 == 0 && flag2 == 0
            f1(teste) = p2(teste);
            f2(teste) = p1(teste);
        else
             f1(teste) = p1(teste);
             f2(teste) = p2(teste);
        end
    end
    
    NovaP(t,:) = f1;
    NovaP(t+1,:) = f2;
end

P = NovaP(:,:);































