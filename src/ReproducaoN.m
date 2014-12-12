function P=Reproducao(NovaP, pc, NumPop, NumGenes)



NovaPTeste = NovaP;
t = 2;
for z = 1:(NumPop-1)/2
    c1 = randi(NumPop,1)
    c2 = randi(NumPop,1)
    
    while (c2 == c1)
        c2 = randi(NumPop,1);
    end
    
    p1 = NovaPTeste(c1,:);
    p2 = NovaPTeste(c2,:);

    f1= zeros(1,NumGenes); 
    f2= zeros(1,NumGenes);
    
    
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
    t = t + 2;
end

P = NovaP(:,:);































