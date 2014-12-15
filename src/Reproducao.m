function P=Reproducao(NovaP, pc, NumPop, NumGenes, viloes, shared)

% Faz o crossover em todos cromossomos com exceção da elite
for t = 2:2:NumPop-1
    c1 = t;
    c2 = t + 1;

    p1 = NovaP(c1,:);
    p2 = NovaP(c2,:);

    f1= zeros(1,NumGenes);
    f2= zeros(1,NumGenes);

    pV = [p1; p2];


    % Calcula a função objetivo para cada time
    for i = 1:2
       F(i) = (Cooperacao(shared, pV(i,:)) + Experiencia(shared, pV(i,:), viloes));
    end

    fV = [abs(F(1)) abs(F(2))];

    % Gera distrubuição de escolha de genes
    [~,R1] = histc(rand(1, NumGenes),cumsum([0;fV(:)./sum(fV)]));
    [~,R2] = histc(rand(1, NumGenes),cumsum([0;fV(:)./sum(fV)]));

    % Gera os genes
    for i = 1:NumGenes
       f1(i) = pV(R1(i), i);
       f2(i) = pV(R2(i), i);
    end

    % Valores repetidos são trocados
    f1 = unique(f1);
    for i = length(f1)+1:NumGenes
      v = setdiff(1:381, f1);
      x = v(randi(numel(v)));
      f1(i) = x;
    end

    f2 = unique(f2);
    for i = length(f2)+1:NumGenes
      v = setdiff(1:381, f2);
      x = v(randi(numel(v)));
      f2(i) = x;
    end

    NovaP(c1,:) = f1;
    NovaP(c2,:) = f2;
end

P = NovaP;