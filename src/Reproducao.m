function P=Reproducao(NovaP, pc, NumPop, NumGenes)

%coloca aleatoriedade na matriz de pais
IndecesIndividuos = randperm(NumPop); 

%Duas strings x1 e y1 sao selecionados a partir da populaçao atual
for x= 1:(floor(NumPop/2))
    p1 = NovaP(IndecesIndividuos(2*x),:);
    p2 = NovaP(IndecesIndividuos(2*x+1),:);
    
    f1= zeros(1,NumPop); 
    f2= zeros(1,NumPop);
    
    ponto_cross= floor(pc * NumGenes); 
    
    y1 = [ones(1, ponto_cross) zeros(1, NumGenes-ponto_cross)]; 
    y1 = y1(randperm(NumGenes)); 
    y2= not(y1);
    
    genes_p1 = p1.*y1; 
    genes_p2 = p2.*y2;
    
    f1= genes_p1+genes_p2;
    
    genes2_p1 = p1.*y2; 
    genes2_p2 = p2.*y1; 
    
    f2=genes2_p1+genes2_p2;
    
    NovaGeracao(2*x,:) = f1;
    NovaGeracao(2*x+1,:) = f2;
    
    P= NovaGeracao;
    
end


    
    
    
    
    
    
    
    
    
        
    
end
    

%Um numero r indica o ponto de crossover. Ele eh selecionado randomicamente

% Duas novas strings sao formadas a partir de x e y, combinando seus grupos de
% atributos a partir da direita de r 
