% Aplica a mutacao em algum gene do individuo
function R=Variacao(NovaP, pm, NumPop, NumGenes, charsAtt, budget, pwgL)

% Variacao em todos genes da populacao
for i=2:NumPop
    if rand < pm
        % Probabilidade do heroi sofrer mutacao é inversamente proporcional ao seu powegrid
        for h = 1:NumGenes                  % Powergrid medio do heroi
            if NovaP(i,h) > 0
                if budget
                   pgm(h) = 1/pwgL(NovaP(i,h)); %popL(NovaP(i,h)) * pwgL(NovaP(i,h));
                else
                   pgm(h) = 1/pwgL(NovaP(i,h));
                end
            else
                pgm(h) = rand();
            end
        end

        % Gera escolha do heroi a sobrer mutação
        [~,ph] = histc(rand(1),cumsum([0;pgm(:)./sum(pgm)]));

        % Efetua a mutacao desconsiderando as posiçoes existentes
        v = setdiff(0:381, NovaP(i,:));
        NovaP(i,ph) = v(randi(numel(v)));
    end
end

R = NovaP;