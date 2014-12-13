function X=Budget1(lista, herois, viloes)

% Powergrid medio dos herois e viloes
heroisPG = Atributos(lista, herois(herois>0));
viloesPG = Atributos(lista, viloes);

% Popularidade dos herois e viloes
heroisPop = Popularidade(lista, herois(herois>0));
viloesPop = Popularidade(lista, viloes);

% Razao entre a media dos powergrids e popularidades dos herois e viloes
RatioPG = mean(heroisPG)/mean(viloesPG);
RatioPop = mean(heroisPop)/mean(viloesPop);

% VTCost
VTCost = 0;
for v = 1:length(viloes)
  % Powergrid medio do vilao v
  pgm = mean(Atributos(lista, viloes(v)));
  % Popularidade do vilao v
  pop = Popularidade(lista, viloes(v));
  % VTCost
  VTCost = VTCost + pgm * pop;
endfor

X = RatioPG * RatioPop * VTCost;
