function P=ReproducaoN(NovaP, pc, NumPop, NumGenes)



NovaPTeste = NovaP;
t = 2;
for z = 1:(NumPop-1)/2
    c1 = randi(NumPop,1);
    c2 = randi(NumPop,1);
    
    while (c2 == c1)
        c2 = randi(NumPop,1);
    end
    
    p1 = NovaPTeste(c1,:);
    p2 = NovaPTeste(c2,:);

    f1= zeros(1,NumGenes); 
    f2= zeros(1,NumGenes);
    
    for i = 1:NumGenes
        d = randi([1 2]);
        if d == 1 
            f1(i) = p1(i);
            f2(i) = p2(i);
        else
            f1(i) = p2(i);
            f2(i) = p1(i);
        end
    end
    flag1 =0;
    valor =0;
    for i = 1:NumGenes
       for j = i+1:NumGenes
            if f1(i) == f1(j)
                v = setdiff(1:381, f1);
                x=v(randi(numel(v)));
               
               
                f1(i) = x;
            end
            if f2(i) == f2(j)
                v = setdiff(1:381, f2);
                x=v(randi(numel(v)));
               f2(i) = x;
            end
       end
    end


    NovaP(t,:) = f1;
    NovaP(t+1,:) = f2;
    t = t + 2;
end

P = NovaP(:,:);































