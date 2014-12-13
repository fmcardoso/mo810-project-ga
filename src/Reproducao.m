function P=Reproducao(NovaP, pc, NumPop, NumGenes, viloes)

%function P=Reproducao(NovaP, pc, NumPop, NumGenes)

dataFolder = '../data/';
shared = MatrizRelacoes(strcat(dataFolder, 'shared_comic_books.csv'));

% Faz o crossover com exceção da elite
for t = 2:2:NumPop-1
    p1 = NovaP(t,:);
    p2 = NovaP(t+1,:);

    f1= zeros(1,NumGenes); 
    f2= zeros(1,NumGenes);
    
    c1 = t;
    c2 = t + 1;


    p1 = NovaP(c1,:);
    p2 = NovaP(c2,:);
    pV = [p1; p2];
    

    % Calcula a função objetivo para cada time
    for i = 1:2
       F(i) = (Cooperacao(shared, pV(i,:)) + Experiencia(shared, pV(i,:), viloes));
    end

    fV = [abs(F(1)) abs(F(2))];
    
    % Gera distrubuição de escolha de genes
    [~,R1] = histc(rand(1, NumGenes),cumsum([0;fV(:)./sum(fV)]));
    %f1 = pV(R:)
    [~,R2] = histc(rand(1, NumGenes),cumsum([0;fV(:)./sum(fV)]));
    %f2 = pV(R:)

    % Gera os genes
    for i = 1:NumGenes
       f1(i) = pV(R1(i), i);
       f2(i) = pV(R2(i), i);
    end

    % Valores repetidos são trocados
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
end

P = NovaP(:,:);































