function X=Viabilidade(herois, viloes, budget=false, charsAtt)

  dataFolder = '../data/';

                                % Carrega as habilidades dos personagens
  L = charsAtt;

                                % Carrega powergrid dos herois e viloes
  H = L(herois(herois>0), 1:6);
  V = L(viloes, 1:6);

                                % Soma powergrid dos herois e viloes
  scoreH = sum(H);
  scoreV = sum(V);

                                % Com budget
  HTCost = 0
  budgetMax = Inf;
  if(budget)
                                % HTCost
    for h = 1:length(herois)
                                % Powergrid medio do heroi
      pgm = mean(Atributos(L, herois(h)));
                                % Popularidade do heroi
      pop = Popularidade(L, herois(h));
                                % HTCost
      HTCost = HTCost + pgm * pop;
    endfor

                                % Calcula budget
    budgetMax = max(Budget1(L,herois,viloes), Budget2(L,herois,viloes));
  endif

                                % Compara media usando apenas inteiros
  if (sum(scoreH * nnz(V) > scoreV * nnz(H)) && (HTCost < budgetMax))
      X = 1;
    else
      X = -1;
    endif