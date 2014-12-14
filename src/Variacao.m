% Aplica a mutacao em algum gene do individuo
function R=Variacao(NovaP, pm, NumPop, NumGenes, charsAtt)

%flag1 = 1;

for i=2:NumPop

    % Probabilidade do heroi sofrer mutacao é inversamente proporcional ao seu powegrid
    for h = 1:NumGenes                  % Powergrid medio do heroi
        if NovaP(i,h) > 0
            pgm(h) = 1/mean(Atributos(charsAtt, NovaP(i, h)));
        else
            pgm(h) = rand()
        end
    end

    % Gera escolha do heroi a sobrer mutação
    [~,ph] = histc(rand(1),cumsum([0;pgm(:)./sum(pgm)]));

    % Efetua a mutacao desconsiderando as posiçoes existentes
    v = setdiff(1:381, NovaP(i,:));
    NovaP(i,ph) =v(randi(numel(v)));

    % for j=1:NumGenes       
    %     sort = rand;
    %     if (sort <= pm)
    %     	while flag1 == 1
    %             valor = randi([0 381]);
    %             flag1 = 0;
    %             for t = 1:NumGenes
    %                 if NovaP(i,t) == valor;
    %                     flag1 = 1;
    %                 end
    %             end
    %         end
    %        NovaP(i,j) = valor;
    %        flag1 = 1;
    %     end
        
    % end
end

R = NovaP;